import 'package:my_webapp/general/data/general_apimodel.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/main_model.dart';

class FirebaseServiceGeneral {
  final String url = 'http://helloworld.api';
  Future<List<GeneralApiModel>> getGeneralOnlyOneData(
      {required String category}) async {
    // gettign data instruction;
    switch (category.toCategories) {
      case PlaceCategory.hotels:
        return [const HotelsApi.test()];
      case PlaceCategory.restourants:
        return [const RestourantApi.test()];
      case PlaceCategory.places:
        return [const PlaysApi.test()];
      case PlaceCategory.museum:
        return [];
    }
  }

  Future<MainGeneralModel> getAllData() async {
    // FirebaseFirestore.instance.get();
    return const MainGeneralModel();
  }

  Future<Set<String>> getTags({required String category}) async {
    return {};
  }
}
