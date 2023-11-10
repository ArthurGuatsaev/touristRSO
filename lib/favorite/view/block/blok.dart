import 'package:my_webapp/favorite/data/favorite_repository_data.dart';
import 'package:my_webapp/favorite/domain/base_favorite_repository.dart';
import 'package:my_webapp/general/domain/general_failure.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final BaseFavoriteRepository _repository;
  FavoriteBloc({BaseFavoriteRepository? repository})
      : _repository = repository ?? FavoriteRepositoryData(),
        super(const FavoriteState()) {
    on<GetDataEvent>(onGetData);
  }
  onGetData(GetDataEvent event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      if (_repository is FavoriteRepositoryData) {
        final model = await _repository.getFaivoriteModel();
        emit(state.copyWith(status: AppStatus.sucsess, model: model));
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(failure: e.message, status: AppStatus.error));
    }
  }

  onSaveData(SaveDataEvent event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      if (_repository is FavoriteRepositoryData) {
        await _repository.saveModel(model: event.model);
        emit(state.copyWith(status: AppStatus.sucsess));
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(failure: e.message, status: AppStatus.error));
    }
  }
}
