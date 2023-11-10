import 'package:my_webapp/general/domain/model/general_model.dart';

abstract class SearchRepository {
  final List<BaseGeneralModel> initialList;
  final Set<String> tegs;
  List<BaseGeneralModel> search(
      {required List<String> activeTags,
      required List<BaseGeneralModel> list,
      required String sort});
  const SearchRepository({required this.initialList, required this.tegs});
}
