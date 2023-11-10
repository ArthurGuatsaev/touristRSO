part of 'blok.dart';

class FavoriteState {
  final List<BaseGeneralModel> model;
  final AppStatus status;
  final String failure;
  const FavoriteState({this.model = const [], this.status = AppStatus.initial, this.failure = ''});

  FavoriteState copyWith({
    List<BaseGeneralModel>? model,
    AppStatus? status,
    String? failure, 
  }) {
    return FavoriteState(
      model: model ?? this.model,
      failure: failure ?? this.failure,
      status: status ?? this.status
    );
  }
}

enum AppStatus {
  sucsess, loading, error, initial
}