part of 'blok.dart';

class AfishaState {
  final Set<AfishaModel> model;
  final AppStatus status;
  final String failure;
  const AfishaState({this.model = const {}, this.status = AppStatus.initial, this.failure = ''});

  AfishaState copyWith({
    Set<AfishaModel>? model,
    AppStatus? status,
    String? failure, 
  }) {
    return AfishaState(
      model: model ?? this.model,
      failure: failure ?? this.failure,
      status: status ?? this.status
    );
  }
}

enum AppStatus {
  sucsess, loading, error, initial
}