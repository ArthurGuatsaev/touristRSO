import 'package:my_webapp/general/domain/model/general_model.dart';

abstract class BaseRatingRepository
    with
        HiveServiceRatingRepository,
        FirebaseServiceResponceRepository,
        FirebaseServiseRatingRepository,
        HiveServiceResponseRepository {
  final List<double> saveRating;
  final List<ResponseModel> saveResponse;
  // final String itemId;
  const BaseRatingRepository(
      {required this.saveRating, required this.saveResponse});
}

mixin HiveServiceRatingRepository {
  // сохранение данных в общем боксе и боксе для отправки изменения на сервер
  Future<void> addSaveRating(
      {required String category,
      required String playsId,
      required double newNumber,
      required String userId});
  Future<void> deleteSaveRating(
      {required String category,
      required String playsId,
      required String userId});
  Future<void> changeSaveRating(
      {required String category,
      required String playsId,
      required String userId,
      required double newNumber});
}
mixin HiveServiceResponseRepository {
  Future<void> addSaveResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId});
  Future<void> deleteSaveResponse(
      {required String category,
      required String playsId,
      required String userId});
  Future<void> changeSaveResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId});
}

mixin FirebaseServiseRatingRepository {
  Future<void> addRating(
      {required String category,
      required String playsId,
      required double newNumber,
      required String userId});
  Future<void> changeRating(
      {required String category,
      required String playsId,
      required double newNumber,
      required String userId});
  Future<void> deleteRating(
      {required String category,
      required String playsId,
      required String userId});
  Future<Map<String, double>> getRating({required String id});
  Stream<List<double>> getRatingStream({required String name});
}

mixin FirebaseServiceResponceRepository {
  Future<void> deleteResponse(
      {required String category,
      required String playsId,
      required String userId});
  Future<void> changeResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId});
  Future<void> addResponse(
      {required String category,
      required String playsId,
      required ResponseModel newResponse,
      required String userId});
  Future<List<ResponseModel>> getResponses({required String id});
  Stream<List<ResponseModel>> getResponseStream({required String name});
}
