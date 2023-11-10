import 'package:my_webapp/general/data/general_wrapper.dart';
import 'package:my_webapp/general/data/service/firebase_general.dart';
import 'package:my_webapp/general/domain/model/main_model.dart';

mixin GeneralFirebaseServiseRepositoryData {
  final FirebaseServiceGeneral _firebaseServiceGeneral =
      FirebaseServiceGeneral();
  Future<MainGeneralModel> getModelData({required String category}) async {
    final data =
        await _firebaseServiceGeneral.getGeneralOnlyOneData(category: category);
    return GeneralModelWrapper.wrapper(data: data);
  }

  Future<MainGeneralModel> getAllData() async {
    final data = await _firebaseServiceGeneral.getAllData();
    return data;
  }

  Future<Set<String>> getTags({required String category}) async {
    return await _firebaseServiceGeneral.getTags(category: category);
  }
}
