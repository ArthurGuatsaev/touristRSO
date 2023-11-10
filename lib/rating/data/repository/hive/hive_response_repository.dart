import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/rating/data/service/hive_response.dart';

mixin HiveRepositoryResponse {
  final HiveServiceResponse _apiHiveResponse = const HiveServiceResponse();
  Future<void> deleteSaveResponse(
      {required String category,
      required String playsId,
      required String userId}) async {
    _apiHiveResponse.deleteResponse(
        category: category, playsId: playsId, userId: userId);
  }

  Future<void> addSaveResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId}) async {
    _apiHiveResponse.addResponse(
        category: category,
        playsId: playsId,
        newResponse: newResponse,
        userId: userId);
  }

  Future<void> changeSaveResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId}) async {
    _apiHiveResponse.changeResponse(
        category: category,
        playsId: playsId,
        newResponse: newResponse,
        userId: userId);
  }
}
