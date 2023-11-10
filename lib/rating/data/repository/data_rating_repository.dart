import 'package:my_webapp/rating/data/repository/firebase/firebase_rating_repostiory.dart';
import 'package:my_webapp/rating/data/repository/firebase/firebase_response_repository.dart';
import 'package:my_webapp/rating/data/repository/hive/hive_rating_repository.dart';
import 'package:my_webapp/rating/data/repository/hive/hive_response_repository.dart';
import 'package:my_webapp/rating/data/service/api_rating.dart';
import 'package:my_webapp/rating/domain/rating_repository.dart';

class DataRatingRepository extends BaseRatingRepository
    with
        HiveRepositoryRating,
        HiveRepositoryResponse,
        FirebaseServiceRatingRepositoryData,
        FirebaseServiceResponceRepositoryData {
  DataRatingRepository(
      {BaseApiRating? api,
      required super.saveResponse,
      required super.saveRating});
}
