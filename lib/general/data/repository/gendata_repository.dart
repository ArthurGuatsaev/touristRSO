import 'package:my_webapp/general/data/repository/firebase_repository.dart';
import 'package:my_webapp/general/data/repository/hive_repository.dart';
import 'package:my_webapp/general/domain/general_repository.dart';

class GeneralDataRepository extends BaseGeneralRepository
    with
        GeneralFirebaseServiseRepositoryData,
        GeneralPersistanceServiseRepositoryData {}
