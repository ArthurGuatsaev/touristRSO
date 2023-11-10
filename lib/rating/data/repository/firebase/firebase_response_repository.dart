import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/rating/data/service/firebase_response.dart';

mixin FirebaseServiceResponceRepositoryData {
  final FirebaseServiceResponse _apiResponce = const FirebaseServiceResponse();
  Future<List<ResponseModel>> getResponses({required String id}) async {
    final respose = await _apiResponce.getResponse(id: id);
    return respose.responses as List<ResponseModel>;
  }

  Future<void> addResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId}) async {
    _apiResponce.addResponse(
        category: category,
        playsId: playsId,
        newResponse: newResponse,
        userId: userId);
  }

  Future<void> deleteResponse(
      {required String category,
      required String playsId,
      required String userId}) async {
    _apiResponce.deleteResponse(
        category: category, playsId: playsId, userId: userId);
  }

  Future<void> changeResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId}) async {
    _apiResponce.changeResponse(
        category: category,
        playsId: playsId,
        newResponse: newResponse,
        userId: userId);
  }

  Stream<List<ResponseModel>> getResponseStream({required String name}) =>
      _apiResponce.getStreamResponses;
}
