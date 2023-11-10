import 'package:my_webapp/support/domain/support_model.dart';

class HiveServiceSupportData {
  Future<bool> checkSupport({required String userId}) async => false;
  Future<void> saveSupportHistory(
      {required String userId,
      required List<SupportMessageModel> messages}) async {}
}
