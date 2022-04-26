import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../app/providers/cat_provider.dart';
import '../../domain/bloc/cat/cat_bloc.dart';
import 'home/home_button.dart';
import 'home/home_card.dart';
import 'home/home_facts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CatProvider(
          child: BlocBuilder<CatBloc, CatState>(
        buildWhen: (previous, current) => current.catStatus.isSuccess,
        builder: (context, state) {
          ValueNotifier<bool> imageLoaded = ValueNotifier<bool>(false);

          return ValueListenableBuilder<bool>(
            valueListenable: imageLoaded,
            builder: (_, value, __) {
              if (!value) {
                Future.delayed(
                  const Duration(milliseconds: 500),
                  () => imageLoaded.value = true,
                );
              }
              return VxBox(
                child: VStack(
                  [
                    HomeCard(
                      loaded: value,
                    ),
                    HomeFacts(
                      text: state.cat == null ? '' : state.cat!.text ?? '',
                    ),
                    HomeButton(
                      onTap: () {
                        context.read<CatBloc>().add(GetCat());
                      },
                      label: 'Another fact!',
                    ),
                    HomeButton(
                      onTap: () {
                        context.router.pushNamed('/history-page');
                      },
                      label: 'Fact history',
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ).makeCentered();
            },
          );
        },
      )),
    );
  }
}
