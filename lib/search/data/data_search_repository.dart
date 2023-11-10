import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/work_time_model.dart';
import 'package:my_webapp/search/domain/search_model.dart';
import 'package:my_webapp/search/domain/search_repository.dart';

class DataSearchRepository extends SearchRepository {
  const DataSearchRepository(
      {required List<BaseGeneralModel> initialList, required Set<String> tegs})
      : super(initialList: initialList, tegs: tegs);
  @override
  List<BaseGeneralModel> search(
      {required List<String> activeTags,
      required List<BaseGeneralModel> list,
      required String sort}) {
    if (activeTags.isEmpty) {
      return mySort(list: list, sort: sort);
    }
    final teg = activeTags.removeAt(0);
    final List<BaseGeneralModel> result = [];
    list.map((item) {
      if (item.teg.contains(teg)) {
        result.add(item);
      }
    }).toList();
    if (activeTags.isEmpty) {
      return mySort(list: list, sort: sort);
    } else {
      return search(activeTags: activeTags, list: result, sort: sort);
    }
  }

  List<BaseGeneralModel> mySort(
      {required List<BaseGeneralModel> list, required String sort}) {
    switch (sort.sortExtension) {
      case SortList.rating:
        list.sort((a, b) => b.rating.rating.compareTo(a.rating.rating));
        return list;
      case SortList.cheap:
        list.sort((a, b) => b.costs.compareTo(a.costs));
        return list;
      case SortList.expensive:
        list.sort((a, b) => a.costs.compareTo(b.costs));
        return list;
      case SortList.near:
        list.sort((a, b) => a.costs.compareTo(b.costs)); // need to develop
        return list;
      case SortList.opened:
        final x = list
            .where((element) =>
                element.workTime.workStatus == OpenClosedStatus.open ||
                element.workTime.workStatus == OpenClosedStatus.almostClosed)
            .toList();
        print(x);
        return list
            .where((element) =>
                element.workTime.workStatus == OpenClosedStatus.open ||
                element.workTime.workStatus == OpenClosedStatus.almostClosed)
            .toList();
    }
  }
}
