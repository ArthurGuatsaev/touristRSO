import 'package:my_webapp/rating/data/models/model_rating_api.dart';
import 'package:my_webapp/setting/where_change.dart';

class FirebaseServiceRating {
  const FirebaseServiceRating();
  final String url = 'http://firebase.api';

  Future<ModelRatingApi> getRating({required String id}) async {
    // get data;
    final Map<String, dynamic> json = {
      'rating': {'id': 5.0}
    };
    final model = ModelRatingApi.fromJson(json: json);
    return model;
  }

  Stream<List<double>> get getRatingStream => streamRating;
  Future<void> deleteRating(
      {required String category,
      required String playsId,
      required String userId}) async {
    //FirebaseFirestore.instance.collection('$category').doc(playsId).get() => (doc)['userId'].delete;
  }
  Future<void> addRating(
      {required String category,
      required String playsId,
      required double newNumber,
      required String userId}) async {}
  Future<void> changeRating(
      {required String category,
      required String playsId,
      required double newNumber,
      required String userId}) async {}
}
