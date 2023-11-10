import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/main_model.dart';

class HiveServiceGeneral {
  Future<MainGeneralModel> getAllSaveData() async {
    // open box and afrer darter
    return const MainGeneralModel();
  }

  Future<List<BaseGeneralModel>> getMenualSaveData(
      {required String category}) async {
    return [];
  }

  Future<void> saveLastData({required MainGeneralModel model}) async {
    // save instruction here;
  }
}
