import 'package:my_webapp/afisha/data/afisha_firebase_service.dart';
import 'package:my_webapp/afisha/domain/afisha_model.dart';
import 'package:my_webapp/afisha/domain/afisha_repository.dart';

class AfishaRepositoryData extends BaseAfishaRepository {
  final AfishaFirebaseService _afishaFirebaseService;
  AfishaRepositoryData({AfishaFirebaseService? afishaFirebaseService})
      : _afishaFirebaseService =
            afishaFirebaseService ?? AfishaFirebaseService();
  @override
  Future<Set<AfishaModel>> getModel() {
    return _afishaFirebaseService.getModel();
  }
}
