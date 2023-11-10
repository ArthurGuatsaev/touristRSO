import 'package:my_webapp/general/domain/model/general_model.dart';

class SearchModel {
  final List<BaseGeneralModel> find;
  final List<BaseGeneralModel> found;
  final BaseGeneralModel item;
  final Set<String> tegs;
  final List<String> activeTags;
  final String sort;
  final List<String> sortList;
  const SearchModel(
      {this.find = const [],
      this.sort = '',
      this.item = const BaseGeneralModel.test(),
      this.sortList = const [],
      this.found = const [],
      this.activeTags = const [],
      this.tegs = const {}});
  SearchModel copyWith(
      {List<BaseGeneralModel>? find,
      BaseGeneralModel? item,
      List<BaseGeneralModel>? found,
      List<String>? activeTags,
      Set<String>? tegs,
      String? sort,
      List<String>? sortList}) {
    return SearchModel(
        find: find ?? this.find,
        found: found ?? this.found,
        item: item ?? this.item,
        activeTags: activeTags ?? this.activeTags,
        tegs: tegs ?? this.tegs,
        sort: sort ?? this.sort,
        sortList: sortList ?? this.sortList);
  }
}

enum SortList { rating, expensive, cheap, near, opened }

extension SortExtension on String {
  SortList get sortExtension {
    switch (this) {
      case 'rating':
        return SortList.rating;
      case 'expensive':
        return SortList.expensive;
      case 'cheap':
        return SortList.cheap;
      case 'near':
        return SortList.near;
      case 'opened':
        return SortList.opened;
      default:
        return SortList.rating;
    }
  }
}
