part of 'blok.dart';

abstract class GeneralEvent {
  const GeneralEvent();
}

class GetDataEvent extends GeneralEvent {
  final String category;
  const GetDataEvent({required this.category});
}
class UpdateItemEvent extends GeneralEvent {
  final BaseGeneralModel item;
  const UpdateItemEvent({required this.item});
}

class GetSaveDataEvent extends GeneralEvent {}
class CheckNetworkEvent extends GeneralEvent {}
class GetAllDataEvent extends GeneralEvent {}
class GetMenualSaveDataEvent extends GeneralEvent {
  final String category;
  const GetMenualSaveDataEvent({required this.category});
}