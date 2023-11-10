import 'package:my_webapp/general/data/repository/gendata_repository.dart';
import 'package:my_webapp/general/domain/general_failure.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/general_repository.dart';
import 'package:my_webapp/general/domain/model/main_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

part 'state.dart';
part 'event.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  final BaseGeneralRepository _repository;
  GeneralBloc({GeneralDataRepository? repository})
      : _repository = repository ?? GeneralDataRepository(),
        super(const GeneralState()) {
    on<GetDataEvent>(onGetMenualData);
    on<GetAllDataEvent>(onGetAllData);
    on<GetSaveDataEvent>(onGetSaveData);
    on<CheckNetworkEvent>(onCheckNetwork);
    on<GetMenualSaveDataEvent>(onGetMenualSaveData);
  }

  onGetMenualData(GetDataEvent event, Emitter<GeneralState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      if (_repository is GeneralDataRepository) {
        final model = await _repository.getModelData(category: event.category);
        switch (event.category.toCategories) {
          case PlaceCategory.restourants:
            emit(state.copyWith(
                model: model.copyWith(restourants: model.restourants)));
          case PlaceCategory.hotels:
            emit(state.copyWith(model: model.copyWith(hotels: model.hotels)));
          case PlaceCategory.places:
            emit(state.copyWith(model: model.copyWith(playses: model.playses)));
          case PlaceCategory.museum:
            emit(state.copyWith(model: model.copyWith()));
        }
        emit(state.copyWith(status: AppStatus.sucsess));
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(failure: e.message, status: AppStatus.error));
    }
  }

  // вызывается после обновления данных в автономном режиме
  onGetMenualSaveData(
      GetMenualSaveDataEvent event, Emitter<GeneralState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      if (_repository is GeneralDataRepository) {
        final model =
            await _repository.getMenualSaveData(category: event.category);
        switch (event.category.toCategories) {
          case PlaceCategory.restourants:
            emit(state.copyWith(
                model: state.model
                    .copyWith(restourants: model as List<Restourant>)));
          case PlaceCategory.hotels:
            emit(state.copyWith(
                model: state.model.copyWith(hotels: model as List<Hotels>)));
          case PlaceCategory.places:
            emit(state.copyWith(
                model: state.model.copyWith(playses: model as List<Plays>)));
          case PlaceCategory.museum:
            emit(state.copyWith(model: state.model.copyWith()));
        }
        emit(state.copyWith(status: AppStatus.sucsess));
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(failure: e.message, status: AppStatus.error));
    }
  }

  onGetSaveData(GetSaveDataEvent event, Emitter<GeneralState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      if (_repository is GeneralDataRepository) {
        final model = await _repository.getAllSaveData();
        emit(state.copyWith(
            status: AppStatus.sucsess,
            model: state.model.copyWith(
                restourants: model.restourants,
                hotels: model.hotels,
                playses: model.playses)));
      }
    } on HiveFailedException catch (e) {
      emit(state.copyWith(failure: e.message, status: AppStatus.error));
    }
  }

  onGetAllData(GetAllDataEvent event, Emitter<GeneralState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      if (_repository is GeneralDataRepository) {
        final model = await _repository.getAllData();
        emit(state.copyWith(
            status: AppStatus.sucsess,
            model: state.model.copyWith(
                restourants: model.restourants,
                hotels: model.hotels,
                playses: model.playses)));
        _repository.saveLastData(model: model);
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(failure: e.message, status: AppStatus.error));
    }
  }

  onCheckNetwork(CheckNetworkEvent event, Emitter<GeneralState> emit) async {
    // check
    // var networkConection = true;
    // if (networkConection) {
    //   add(GetAllDataEvent());
    // } else {
    //   add(GetSaveDataEvent());
    // };
  }

  onUpdateItem(UpdateItemEvent event, Emitter<GeneralState> emit) {
    // обновление стейта измененного рейтинга офлайн;
    switch (event.item.mainCategory.toCategories) {
      case PlaceCategory.restourants:
        final newList = state.model.restourants
            .where((element) => element.id != event.item.id)
            .toList();
        newList.add(event.item as Restourant);
        emit(state.copyWith(model: state.model.copyWith(restourants: newList)));
        // сохранение изменений в кэш;
        _repository.saveLastData(model: state.model);
        return;
      case PlaceCategory.hotels:
        final newList = state.model.hotels
            .where((element) => element.id != event.item.id)
            .toList();
        newList.add(event.item as Hotels);
        emit(state.copyWith(model: state.model.copyWith(hotels: newList)));
        _repository.saveLastData(model: state.model);
        return;
      case PlaceCategory.places:
        final newList = state.model.playses
            .where((element) => element.id != event.item.id)
            .toList();
        newList.add(event.item as Plays);
        emit(state.copyWith(model: state.model.copyWith(playses: newList)));
        _repository.saveLastData(model: state.model);
        return;
      case PlaceCategory.museum:
        final newList = state.model.playses
            .where((element) => element.id != event.item.id)
            .toList();
        newList.add(event.item as Plays);
        emit(state.copyWith(model: state.model.copyWith(playses: newList)));
        _repository.saveLastData(model: state.model);
        return;
    }
  }
}

myHoliday(int x) {
  final date = DateTime(2023, 11, 1);
  final result = date.add(Duration(days: x));
  print('month: ${result.month} day: ${result.day}');
  return result;
}

void main() {
  test('holiday', () {
    expect(myHoliday(45), DateTime);
  });
}
