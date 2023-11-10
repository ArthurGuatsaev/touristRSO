import 'package:my_webapp/support/domain/support_model.dart';

class FirebaseServiceSupportData {
  Stream<List<SupportMessageModel>> getSupportMessages({required String id}) => Stream.empty();
  Future<void> writeSupportMessage({required String id, required String messageText, required String userName}) async {}
}
