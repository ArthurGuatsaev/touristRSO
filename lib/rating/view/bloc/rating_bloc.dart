import 'package:my_webapp/general/domain/general_failure.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/rating/data/repository/data_rating_repository.dart';
import 'package:my_webapp/rating/domain/rating_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'rating_state.dart';
part 'rating_event.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final BaseRatingRepository _repository;
  RatingBloc({required BaseRatingRepository ratingRepository})
      : _repository = ratingRepository,
        super(const RatingState()) {
    on<GetRatingAndResponseEvent>(onGetRatingAndResponse);
    on<AddRatingEvent>(onAddRating);
    on<ChangeRatingEvent>(onChangeRating);
    // on<GetResponseEvent>(onGetResponse);
    on<AddResponseEvent>(onAddResponse);
    on<DeleteResponseEvent>(onDeleteResponse);
// weather get stream or future;
    // on<GetStreamRatingEvent>(onGetRatingStream);
    // on<GetStreamResponseEvent>(onGetResponseStream);
    on<CheckNetworkEvent>(onCheckNetwork);
  }

  onCheckNetwork(CheckNetworkEvent event, Emitter<RatingState> emit) async {
    // только для установления переменной результата проверки соединения
    // также для отправки изменений из кеша после востановления соединения, а также отчистки кэша
    emit(state.copyWith(
        isConnectNet:
            true)); // here will be result of stream's check network connect
  }

  // onGetRatingStream(GetStreamRatingEvent event, Emitter<RatingState> emit) async {
  //   try{
  //     //network check if () {} else {emit(state.copyWith(rating: _repository.saveRating))},
  //     if (_repository is DataRatingRepository) {
  //     emit(state.copyWith(ratingStatus: RatingStatus.loading));
  //     await emit.forEach(_repository.getRatingStream(name: event.plays), onData: (data) {
  //       final rating = data;
  //       return state.copyWith(model: state.model.copyWith(rating: rating), ratingStatus: RatingStatus.sucsess);
  //     },);
  //   }} on HttpRequestFailedException catch(e) {
  //     emit(state.copyWith(failure: e.message, ratingStatus: RatingStatus.error));
  //   }
  // }

  onGetRatingAndResponse(
      GetRatingAndResponseEvent event, Emitter<RatingState> emit) async {
    // будет использоваться при принудительном обновлении рейтинга и отзывово
    try {
      if (_repository is DataRatingRepository) {
        emit(state.copyWith(ratingStatus: RatingStatus.loading));
        final rating = await _repository.getRating(id: state.model.id);
        final response = await _repository.getResponses(id: state.model.id);
        emit(state.copyWith(
            model: state.model
                .copyWith(rating: ItemRating(listRate: rating), rate: response),
            ratingStatus: RatingStatus.sucsess));
      }
    } on HttpRequestFailedException catch (e) {
      emit(
          state.copyWith(failure: e.message, ratingStatus: RatingStatus.error));
    }
  }

  onAddRating(AddRatingEvent event, Emitter<RatingState> emit) async {
    try {
      if (_repository is DataRatingRepository) {
        if (!state.isConnectNet) {
          // запись данных в случае отсутствия сети в кэш и подготовка к отправке (в отдельном боксе) на сервер после доступа к сети
          await _repository.addSaveRating(
              category: event.item.mainCategory,
              userId: 'event.item.id',
              newNumber: event.number,
              playsId: event.item.id);
          return emit(
              state.copyWith(ratingStatus: RatingStatus.requiredUpdate));
        }
        await _repository.addRating(
            category: event.item.mainCategory,
            userId: 'event.item.id',
            newNumber: event.number,
            playsId: event.item.id);
        final newRating = {...state.model.rating.listRating};
        newRating[event.item.id] = event.number;
        emit(state.copyWith(
            model:
                state.model.copyWith(rating: ItemRating(listRate: newRating))));
      }
    } on HttpRequestFailedException catch (e) {
      emit(
          state.copyWith(failure: e.message, ratingStatus: RatingStatus.error));
    }
  }

  onChangeRating(ChangeRatingEvent event, Emitter<RatingState> emit) async {
    try {
      if (_repository is DataRatingRepository) {
        if (!state.isConnectNet) {
          // запись данных в случае отсутствия сети в кэш и подготовка к отправке (в отдельном боксе) на сервер после доступа к сети
          await _repository.changeSaveRating(
              category: event.item.mainCategory,
              playsId: event.item.id,
              userId: 'userId',
              newNumber: event.number);
          return emit(
              state.copyWith(ratingStatus: RatingStatus.requiredUpdate));
        }
        await _repository.changeRating(
            category: event.item.mainCategory,
            userId: 'event.item.id',
            newNumber: event.number,
            playsId: event.item.id);
      }
    } on HttpRequestFailedException catch (e) {
      emit(
          state.copyWith(failure: e.message, ratingStatus: RatingStatus.error));
    }
  }

  // onGetResponseStream(GetStreamResponseEvent event, Emitter<RatingState> emit) async {
  //   try{
  //     //network check if () {} else
  //     if (_repository is DataRatingRepository) {
  //       emit(state.copyWith(responseStatus: RatingStatus.loading));
  //     await emit.forEach(_repository.getResponseStream(name: event.plays), onData: (data) {
  //       final response = data;
  //       return state.copyWith(model: state.model.copyWith(responses: response), responseStatus: RatingStatus.sucsess);
  //     },);
  //   }} on HttpRequestFailedException catch(e) {
  //     emit(state.copyWith(failure: e.message, responseStatus: RatingStatus.error));
  //   }
  // }

  // onGetResponse(GetResponseEvent event, Emitter<RatingState> emit) async {
  //   try{
  //     if (_repository is DataRatingRepository) {
  //       emit(state.copyWith(responseStatus: RatingStatus.loading));

  //     final response = await _repository.getResponses(name: event.plays);
  //     emit(state.copyWith(model: state.model.copyWith(responses: response), responseStatus: RatingStatus.sucsess));
  //   }} on HttpRequestFailedException catch(e) {
  //     emit(state.copyWith(failure: e.message, responseStatus: RatingStatus.error));
  //   }
  // }

  onAddResponse(AddResponseEvent event, Emitter<RatingState> emit) async {
    try {
      //isCheckNet if () {} else
      if (_repository is DataRatingRepository) {
        if (!state.isConnectNet) {
          await _repository.addSaveResponse(
              category: event.item.mainCategory,
              playsId: event.item.id,
              newResponse: event.response,
              userId: 'userId');
          return emit(
              state.copyWith(responseStatus: RatingStatus.requiredUpdate));
        }
        await _repository.addResponse(
            category: event.item.mainCategory,
            playsId: event.item.id,
            newResponse: event.response,
            userId: 'userId');
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(
          failure: e.message, responseStatus: RatingStatus.error));
    }
  }

  onChangeResponse(ChangeResponseEvent event, Emitter<RatingState> emit) async {
    try {
      //isCheckNet if () {} else
      if (_repository is DataRatingRepository) {
        if (!state.isConnectNet) {
          await _repository.changeSaveResponse(
              category: event.item.mainCategory,
              playsId: event.item.id,
              newResponse: event.response,
              userId: 'userId');
          return emit(
              state.copyWith(responseStatus: RatingStatus.requiredUpdate));
        }
        // await _repository.addRespose(respose: event.response);
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(
          failure: e.message, responseStatus: RatingStatus.error));
    }
  }

  onDeleteResponse(DeleteResponseEvent event, Emitter<RatingState> emit) async {
    try {
      //isCheckNet if () {} else
      if (_repository is DataRatingRepository) {
        if (!state.isConnectNet) {
          await _repository.deleteSaveRating(
              category: event.item.mainCategory,
              playsId: event.item.id,
              userId: 'userId');
          return emit(
              state.copyWith(responseStatus: RatingStatus.requiredUpdate));
        }
        await _repository.deleteResponse(
            category: event.item.mainCategory,
            playsId: event.item.id,
            userId: 'userId');
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(
          failure: e.message, responseStatus: RatingStatus.error));
    }
  }
}
