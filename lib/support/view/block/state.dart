part of 'blok.dart';

class SupportState {
  final List<SupportMessageModel> model;
  final List<List<SupportMessageModel>> listModel;
  final AppStatus status;
  final String failure;
  const SupportState({this.model = const [], this.status = AppStatus.initial, this.failure = '', this.listModel = const []});

  SupportState copyWith({
    List<SupportMessageModel>? model,
    AppStatus? status,
    String? failure, 
    List<List<SupportMessageModel>>? listModel
  }) {
    return SupportState(
      model: model ?? this.model,
      listModel: listModel??this.listModel,
      failure: failure ?? this.failure,
      status: status ?? this.status
    );
  }
}

enum AppStatus {
  sucsess, loading, error, initial
}