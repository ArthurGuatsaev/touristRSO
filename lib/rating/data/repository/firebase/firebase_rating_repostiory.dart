import 'package:my_webapp/rating/data/service/firebase_rating.dart';

mixin FirebaseServiceRatingRepositoryData {
  final FirebaseServiceRating _apiRating = const FirebaseServiceRating();

  Future<void> addRating(
      {required String category,
      required String playsId,
      required double newNumber,
      required String userId}) async {
    _apiRating.addRating(
        category: category,
        playsId: playsId,
        newNumber: newNumber,
        userId: userId);
  }

  Stream<List<double>> getRatingStream({required String name}) =>
      _apiRating.getRatingStream;
  Future<void> changeRating(
      {required String category,
      required String playsId,
      required double newNumber,
      required String userId}) async {
    _apiRating.changeRating(
        category: category,
        playsId: playsId,
        newNumber: newNumber,
        userId: userId);
  }

  Future<void> deleteRating(
      {required String category,
      required String playsId,
      required String userId}) async {
    _apiRating.deleteRating(
        category: category, playsId: playsId, userId: userId);
  }

  Future<Map<String, double>> getRating({required String id}) async {
    final rating = await _apiRating.getRating(id: id);
    return rating.rating as Map<String, double>;
  }
}
