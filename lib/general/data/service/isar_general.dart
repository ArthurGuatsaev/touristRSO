import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/model/general_model.dart';
import '../../domain/model/main_model.dart';

class IsarServiceGeneral {
  Isar? _isar;
  Future<Isar> get isarGetter async {
    final apDir = await getApplicationDocumentsDirectory();
    _isar ??= await Isar.open([], directory: apDir.path);
    return _isar!;
  }

  Future<MainGeneralModel> getAllSaveData() async {
    // final isar = await isarGetter;
    // return await isar.myIsarCollections.where().findAll();
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
