part of 'history_bloc.dart';

enum HistoryStatus { initial, success, error, loading }

extension HistoryStatusExt on HistoryStatus {
  bool get isInitial => this == HistoryStatus.initial;
  bool get isSuccess => this == HistoryStatus.success;
  bool get isError => this == HistoryStatus.error;
  bool get isLoading => this == HistoryStatus.loading;
}

class HistoryState extends Equatable {
  final HistoryStatus status;
  final List<List<String>>? history;

  const HistoryState({
    this.status = HistoryStatus.initial,
    this.history,
  });

  @override
  List<Object?> get props => [status, history];

  HistoryState copyWith({
    Cat? cat,
    HistoryStatus? status,
    List<List<String>>? history,
  }) {
    return HistoryState(
      status: status ?? this.status,
      history: history,
    );
  }
}
