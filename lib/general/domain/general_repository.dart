import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/main_model.dart';

abstract class BaseGeneralRepository
    with GeneralFirebaseRepository, GeneralPersistanceRepository {}

mixin GeneralFirebaseRepository {
  Future<MainGeneralModel> getModelData({required String category});
  Future<MainGeneralModel> getAllData();
  Future<Set<String>> getTags({required String category});
}
mixin GeneralPersistanceRepository {
  Future<MainGeneralModel> getAllSaveData();
  Future<List<BaseGeneralModel>> getMenualSaveData({required String category});
  Future<void> saveLastData({required MainGeneralModel model});
}

