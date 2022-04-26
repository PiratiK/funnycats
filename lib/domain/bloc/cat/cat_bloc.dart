import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../../../data/models/cat_model.dart';
import '../../repositories/cat_repository.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository catRepository;
  CatBloc({
    required this.catRepository,
  }) : super(const CatState()) {
    on<GetCat>(_mapGetCatsEventToState);
  }

  void _mapGetCatsEventToState(GetCat event, Emitter<CatState> emit) async {
    emit(state.copyWith(catStatus: CatStatus.loading));
    try {
      final cat = await catRepository.getRandomCatInfo();
      emit(state.copyWith(catStatus: CatStatus.success, cat: cat));

      final LazyBox<List<String>> box = Hive.isBoxOpen('cats')
          ? Hive.lazyBox('cats')
          : await Hive.openLazyBox<List<String>>('cats');

      await box.put(cat.id, [
        cat.text!,
        cat.createdAt!,
      ]);
    } catch (error, stacktrace) {
      Logger().e(stacktrace);
      emit(state.copyWith(catStatus: CatStatus.error));
    }
  }
}
