import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../app/providers/cat_provider.dart';
import '../../domain/bloc/cat/cat_bloc.dart';
import '../widgets/non_cache_image.dart';

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
                    if (value)
                      VxBox(
                        child: const NonCacheNetworkImage(
                          'https://cataas.com/cat',
                        ),
                      )
                          .width(context.percentWidth * 85.0)
                          .height(
                            context.percentWidth * 85.0,
                          )
                          .makeCentered(),
                    if (!value)
                      VxBox()
                          .width(context.percentWidth * 85.0)
                          .height(
                            context.percentWidth * 85.0,
                          )
                          .makeCentered(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    VxBox(
                      child: AutoSizeText(
                        state.cat == null ? '' : state.cat!.text ?? '',
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.amber,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ).height(context.percentHeight * 20.0).p16.makeCentered(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CatBloc>().add(GetCat());
                        // imageLoaded.value = false;
                      },
                      child: VxBox(
                              child: const Text(
                        'Another fact!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0),
                      ))
                          .alignCenter
                          .width(150)
                          .height(50)
                          .green300
                          .makeCentered(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.pushNamed('/history-page');
                      },
                      child: VxBox(
                              child: const Text(
                        'Fact history',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0),
                      ))
                          .alignCenter
                          .width(150)
                          .height(50)
                          .green300
                          .makeCentered(),
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
