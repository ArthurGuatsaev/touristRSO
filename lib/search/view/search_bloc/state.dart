part of 'blok.dart';

class SearchState {
  final SearchModel model;
  final String failure;
  final AppStatus status;
  const SearchState({this.model = const SearchModel(), this.failure = '', this.status = AppStatus.initial});
  SearchState copyWith({SearchModel? model, String? failure, AppStatus? status,}) {
    return SearchState(
      model: model?? this.model,
      failure: failure?? this.failure,
      status: status?? this.status,
    );
  }
}

enum AppStatus {
  sucsess, loading, error, initial
}