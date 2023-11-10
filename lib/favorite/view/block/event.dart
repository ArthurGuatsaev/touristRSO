part of 'blok.dart';

abstract class FavoriteEvent {
  const FavoriteEvent();
}

class GetDataEvent extends FavoriteEvent{}
class SaveDataEvent extends FavoriteEvent{
  final BaseGeneralModel model;
  const SaveDataEvent({required this.model});
}