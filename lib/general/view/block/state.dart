part of 'blok.dart';

class GeneralState {
  final MainGeneralModel model;
  final AppStatus status;
  final String failure;
  const GeneralState({this.model = const MainGeneralModel(), this.status = AppStatus.initial, this.failure = ''});
   
  GeneralState copyWith({
    MainGeneralModel? model,
    AppStatus? status,
    String? failure, 
  }) {
    return GeneralState(
      model: model ?? this.model,
      failure: failure ?? this.failure,
      status: status ?? this.status
    );
  }
  
}

enum AppStatus {
  sucsess, loading, error, initial
}