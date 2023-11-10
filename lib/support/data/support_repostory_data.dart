import 'package:my_webapp/support/data/services/firebase_support_service.dart';
import 'package:my_webapp/support/data/services/hive_support_service.dart';
import 'package:my_webapp/support/domain/base_support_repository.dart';
import 'package:my_webapp/support/domain/support_model.dart';

class SupportRepositoryData extends BaseSupportRepository
    with FirebaseSupportRepository, HiveSupportRepository {}

mixin FirebaseSupportRepository {
  final FirebaseServiceSupportData _firebase = FirebaseServiceSupportData();
  Stream<List<SupportMessageModel>> getSupportMessages({required String id}) =>
      _firebase.getSupportMessages(id: id);
  Future<void> writeSupportMessage(
          {required String id,
          required String messageText,
          required String userName}) async =>
      _firebase.writeSupportMessage(
          id: id, messageText: messageText, userName: userName);
}

mixin HiveSupportRepository {
  final HiveServiceSupportData _hive = HiveServiceSupportData();
  Future<bool> checkSupport({required String userId}) async =>
      _hive.checkSupport(userId: userId);
  Future<void> saveSupportHistory(
          {required String userId,
          required List<SupportMessageModel> messages}) async =>
      _hive.saveSupportHistory(userId: userId, messages: messages);
}
