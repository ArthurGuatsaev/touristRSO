// import 'package:my_webapp/general/data/service/hive_general.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/main_model.dart';

import '../service/isar_general.dart';

mixin GeneralPersistanceServiseRepositoryData {
  // final HiveServiceGeneral _hiveServiseGeneral = HiveServiceGeneral();
  final IsarServiceGeneral _isarServiseGeneral = IsarServiceGeneral();
  Future<MainGeneralModel> getAllSaveData() async {
    final data = await _isarServiseGeneral.getAllSaveData();
    return data;
  }

  Future<List<BaseGeneralModel>> getMenualSaveData(
      {required String category}) async {
    return await _isarServiseGeneral.getMenualSaveData(category: category);
  }

  Future<void> saveLastData({required MainGeneralModel model}) async {
    //open box
    await _isarServiseGeneral.saveLastData(model: model);
  }
}
