import 'package:my_webapp/general/domain/model/general_model.dart';

class HiveServiceResponse {
  const HiveServiceResponse();
  // сохраняем все изменения, в случае отсутствия подключения к сети, в один бокс;
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
