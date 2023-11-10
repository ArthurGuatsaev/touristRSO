import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/rating/data/models/model_rating_api.dart';

class FirebaseServiceResponse {
  final String url = 'http://yandex.resposes.api';
  const FirebaseServiceResponse();

  Future<ModelResponseApi> getResponse({required String id}) async {
    // get data;
    final Map<String, dynamic> json = {'responses': '["hello lisichansk"]'};
    final model = ModelResponseApi.fromJson(responseApi: json);
    return model;
  }

  Stream<List<ResponseModel>> get getStreamResponses => const Stream.empty();
  Future<void> deleteResponse(
      {required String category,
      required String playsId,
      required String userId}) async {}
  Future<void> addResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId}) async {}
  Future<void> changeResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId}) async {}
}
