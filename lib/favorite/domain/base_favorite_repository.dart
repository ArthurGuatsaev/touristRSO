import 'package:my_webapp/general/domain/model/general_model.dart';

abstract class BaseFavoriteRepository {
  Future<List<BaseGeneralModel>> getFaivoriteModel();
  Future<void> saveModel({required BaseGeneralModel model});
}
