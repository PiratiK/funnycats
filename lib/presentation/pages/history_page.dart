import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../app/providers/history_provider.dart';
import '../../domain/bloc/history/history_bloc.dart';
import 'history/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: HistoryProvider(
          child: BlocBuilder<HistoryBloc, HistoryState>(
        buildWhen: (previous, current) => current.status.isSuccess,
        builder: (context, state) {
          // if (state.history == null) {
          //   return VxBox(child: const CircularProgressIndicator())
          //       .makeCentered();
          // }
          return ListView.builder(
            itemCount: state.history == null ? 0 : state.history!.length,
            itemBuilder: (context, index) {
              return HistoryCard(
                text: state.history![index].text!,
                date: state.history![index].createdAt!.toString().split('.')[0],
              );
            },
          );
        },
      )),
    );
  }
}
