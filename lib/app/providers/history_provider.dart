import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/history/history_bloc.dart';

class HistoryProvider extends StatelessWidget {
  final Widget child;
  const HistoryProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc()..add(GetHistory()),
      child: child,
    );
  }
}
