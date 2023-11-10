class SupportMessageModel {
  final String userName;
  final DateTime dateTime;
  final String message;
  const SupportMessageModel({required this.userName, required this.message, required this.dateTime});
  SupportMessageModel.initial(this.dateTime, {this.message = '', this.userName = ''});
  static SupportMessageModel initialSupport() {
    return SupportMessageModel.initial(DateTime.now());
  }
}