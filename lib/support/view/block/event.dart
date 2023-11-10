part of 'blok.dart';

abstract class SupportEvent {
  const SupportEvent();
}

class GetSupportMessagesEvent extends SupportEvent {}
class GeneralStreamEvent extends SupportEvent {}
class SaveHistoryEvent extends SupportEvent {
  final List<SupportMessageModel> message;
  const SaveHistoryEvent({required this.message});
}