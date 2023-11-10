import 'package:my_webapp/afisha/domain/afisha_model.dart';

abstract class BaseAfishaRepository {
  Future<Set<AfishaModel>> getModel();
}
