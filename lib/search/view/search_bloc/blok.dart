import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/search/data/data_search_repository.dart';
import 'package:my_webapp/search/domain/search_model.dart';
import 'package:my_webapp/search/domain/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository;
  SearchBloc({required SearchRepository repository})
      : _repository = repository,
        super(const SearchState()) {
    on<TegSearchEvent>(onSearch);
    on<DeleteTegEvent>(onDeleteTeg);
    on<AddSearchTeg>(onAddSearchTeg);
    on<AddSortEvent>(onAddSort);
  }
  onSearch(TegSearchEvent event, Emitter<SearchState> emit) {
    if (_repository is DataSearchRepository) {
      final found = _repository.search(
          activeTags: event.searchList,
          list: _repository.initialList,
          sort: event.sort);
      emit(state.copyWith(
          model:
              state.model.copyWith(find: _repository.initialList, found: found),
          status: AppStatus.sucsess));
    }
  }

  onDeleteTeg(DeleteTegEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(status: AppStatus.loading));
    final search = [...state.model.activeTags];
    search.remove(event.search);
    add(TegSearchEvent(searchList: search));
  }

  onAddSearchTeg(AddSearchTeg event, Emitter<SearchState> emit) {
    emit(state.copyWith(status: AppStatus.loading));
    final search = [...state.model.activeTags];
    search.add(event.search);
    add(TegSearchEvent(searchList: search));
  }

  onAddSort(AddSortEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(status: AppStatus.loading));
    emit(state.copyWith(model: state.model.copyWith(sort: event.sort)));
    add(TegSearchEvent(searchList: state.model.activeTags));
  }

  onChooseItem(ChooseItemEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(model: state.model.copyWith(item: event.item)));
  }
}
