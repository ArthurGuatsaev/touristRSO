import 'package:my_webapp/general/data/repository/gendata_repository.dart';
import 'package:my_webapp/general/domain/general_failure.dart';
import 'package:my_webapp/general/domain/user_model.dart';
import 'package:my_webapp/support/data/support_repostory_data.dart';
import 'package:my_webapp/support/domain/base_support_repository.dart';
import 'package:my_webapp/support/domain/support_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final BaseSupportRepository _repository;
  final MyUser? _user;
  SupportBloc({BaseSupportRepository? repository, MyUser? user})
      : _repository = repository ?? SupportRepositoryData(),
        _user = user,
        super(const SupportState()) {
    on<GetSupportMessagesEvent>(onGetSupportMessages);
    on<SaveHistoryEvent>(onSaveHistory);
  }

  onGetSupportMessages(
      GetSupportMessagesEvent event, Emitter<SupportState> emit) async {
    try {
      if (_repository is GeneralDataRepository) {
        if (_user != null) {
          final haveSupport = await _repository.checkSupport(userId: _user!.id);
          if (haveSupport) {
            emit(state.copyWith(status: AppStatus.loading));
            emit.forEach(_repository.getSupportMessages(id: _user!.id),
                onData: (data) {
              return state.copyWith(model: data, status: AppStatus.sucsess);
            });
          }
        }
      }
    } on HttpRequestFailedException catch (e) {
      emit(state.copyWith(failure: e.message, status: AppStatus.error));
    }
  }

  onGeneralStream(GeneralStreamEvent event, Emitter<SupportState> emit) async {
    await emit.forEach(const Stream.empty(), onData: (onData) {
      final List<List<SupportMessageModel>> generalList = [];
      // need to sort by date;
      return state.copyWith(listModel: generalList);
    });
  }

  onSaveHistory(SaveHistoryEvent event, Emitter<SupportState> emit) async {
    _repository.saveSupportHistory(userId: _user!.id, messages: event.message);
  }
}
