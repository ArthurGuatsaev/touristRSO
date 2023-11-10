import 'package:my_webapp/rating/data/service/firebase_rating.dart';
import 'package:my_webapp/rating/data/service/firebase_response.dart';
import 'package:my_webapp/rating/data/service/hive_rating.dart';
import 'package:my_webapp/rating/data/service/hive_response.dart';

class BaseApiRating {
  final FirebaseServiceRating rating;
  final FirebaseServiceResponse respose;
  final HiveServiceRating saveRating;
  final HiveServiceResponse saveResponse;
  const BaseApiRating(
      {required this.rating,
      required this.respose,
      required this.saveRating,
      required this.saveResponse});
}
