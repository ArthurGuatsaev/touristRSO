import 'package:my_webapp/general/data/general_apimodel.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/main_model.dart';

class GeneralModelWrapper {
  static MainGeneralModel wrapper({required List<GeneralApiModel> data}) {
    final listModel = data.map((e) {
      return e.fromApi(e);
    }).toList();
    final category = listModel.first.mainCategory.toCategories;
    switch (category) {
      case PlaceCategory.restourants:
        listModel as List<Restourant>;
        return MainGeneralModel(restourants: listModel);
      case PlaceCategory.hotels:
        listModel as List<Hotels>;
        return MainGeneralModel(hotels: listModel);
      case PlaceCategory.places:
        listModel as List<Plays>;
        return MainGeneralModel(playses: listModel);
      default:
        return const MainGeneralModel();
    }
  }
}
