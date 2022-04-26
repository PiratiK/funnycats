part of 'cat_bloc.dart';

enum CatStatus { initial, success, error, loading }

extension CatStatusExt on CatStatus {
  bool get isInitial => this == CatStatus.initial;
  bool get isSuccess => this == CatStatus.success;
  bool get isError => this == CatStatus.error;
  bool get isLoading => this == CatStatus.loading;
}

class CatState extends Equatable {
  final CatStatus catStatus;
  final Cat? cat;
  final List<List<String>>? history;

  const CatState({
    this.catStatus = CatStatus.initial,
    this.cat,
    this.history,
  });

  @override
  List<Object?> get props => [catStatus, cat];

  CatState copyWith({
    Cat? cat,
    CatStatus? catStatus,
    List<List<String>>? history,
  }) {
    return CatState(
      catStatus: catStatus ?? this.catStatus,
      cat: cat,
      history: history,
    );
  }
}
