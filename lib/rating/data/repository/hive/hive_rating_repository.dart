import 'package:my_webapp/rating/data/service/hive_rating.dart';

mixin HiveRepositoryRating {
  final HiveServiceRating _apiHiveRating = const HiveServiceRating();

  Future<void> addSaveRating(
      {required String category,
      required String playsId,
      required double newNumber,
      required String userId}) async {
    _apiHiveRating.addRating(
        category: category,
        playsId: playsId,
        newNumber: newNumber,
        userId: userId);
  }

  Future<void> deleteSaveRating(
      {required String category,
      required String playsId,
      required String userId}) async {
    _apiHiveRating.deleteRating(
        category: category, playsId: playsId, userId: userId);
  }

  Future<void> changeSaveRating(
      {required String category,
      required String playsId,
      required String userId,
      required double newNumber}) async {
    _apiHiveRating.changeRating(
        category: category,
        playsId: playsId,
        userId: userId,
        newNumber: newNumber);
  }
}
