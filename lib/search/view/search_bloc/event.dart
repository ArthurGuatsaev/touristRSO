part of 'blok.dart';
abstract class SearchEvent {
  const SearchEvent();
}

class TegSearchEvent extends SearchEvent {
  final List<String> searchList;
  final String sort;
  const TegSearchEvent({required this.searchList, this.sort = 'rating'});
}
class DeleteTegEvent extends SearchEvent {
  final String search;
  const DeleteTegEvent({required this.search});
}
class AddSearchTeg extends SearchEvent {
  final String search;
  const AddSearchTeg({required this.search});
}
class AddSortEvent extends SearchEvent {
  final String sort;
  const AddSortEvent({required this.sort});
}
class ChooseItemEvent extends SearchEvent {
  final BaseGeneralModel item;
  const ChooseItemEvent({required this.item});
}