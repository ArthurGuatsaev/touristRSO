import 'package:my_webapp/afisha/data/afisha_repository_data.dart';
import 'package:my_webapp/afisha/domain/afisha_model.dart';
import 'package:my_webapp/afisha/domain/afisha_repository.dart';
import 'package:my_webapp/general/domain/general_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class AfishaBloc extends Bloc<AfishaEvent, AfishaState> {
  final BaseAfishaRepository _repository;
  AfishaBloc({BaseAfishaRepository? repository})
      : _repository = repository ?? AfishaRepositoryData(),
        super(const AfishaState()) {
    on<GetDataEvent>(onGetData);
  }
  onGetData(GetDataEvent event, Emitter<AfishaState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      if (_repository is AfishaRepositoryData) {
        final model = await _repository.getModel();
        emit(state.copyWith(status: AppStatus.sucsess, model: model));
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(failure: e.message, status: AppStatus.error));
    }
  }
}
