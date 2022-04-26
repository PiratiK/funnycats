import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../../../data/models/cat_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState()) {
    on<GetHistory>(_mapGetHistoryEventToState);
  }

  void _mapGetHistoryEventToState(
      GetHistory event, Emitter<HistoryState> emit) async {
    emit(state.copyWith(status: HistoryStatus.loading));
    try {
      final LazyBox<Cat> box = Hive.isBoxOpen('cats')
          ? Hive.lazyBox('cats')
          : await Hive.openLazyBox<Cat>('cats');

      List<Cat> history = [];
      for (int i = box.keys.length - 1; i >= 0; i--) {
        var currentData = await box.getAt(i);
        history.add(currentData!);
      }

      emit(state.copyWith(history: history, status: HistoryStatus.success));
    } catch (error, stacktrace) {
      Logger().e(stacktrace);
      emit(state.copyWith(status: HistoryStatus.error));
    }
  }
}
