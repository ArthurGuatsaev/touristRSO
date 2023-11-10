import 'package:my_webapp/support/domain/support_model.dart';

abstract class BaseSupportRepository
    with FirebaseServiceSupport, HiveServiceSupport {}

mixin HiveServiceSupport {
  Future<bool> checkSupport({required String userId});
  Future<void> saveSupportHistory(
      {required String userId, required List<SupportMessageModel> messages});
}
mixin FirebaseServiceSupport {
  Stream<List<SupportMessageModel>> getSupportMessages({required String id});
  Future<void> writeSupportMessage(
      {required String id,
      required String messageText,
      required String userName});
}
