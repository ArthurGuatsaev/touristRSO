part of 'rating_bloc.dart';
abstract class RatingEvent {
  const RatingEvent();
}

class GetRatingAndResponseEvent extends RatingEvent {}

class GetStreamRatingEvent extends RatingEvent {
  final String plays;
  const GetStreamRatingEvent({required this.plays});
}

class GetResponseEvent extends RatingEvent {
  final String plays;
  GetResponseEvent({required this.plays});
}

class GetStreamResponseEvent extends RatingEvent {
  final String plays;
  GetStreamResponseEvent({required this.plays});
}

class AddRatingEvent extends RatingEvent {
  final BaseGeneralModel item;
  final double number;
  const AddRatingEvent({required this.number, required this.item});
}

class ChangeRatingEvent extends RatingEvent {
  final BaseGeneralModel item;
  final double number;
  const ChangeRatingEvent({required this.number, required this.item});
}

class DeleteResponseEvent extends RatingEvent {
  final BaseGeneralModel item;
  const DeleteResponseEvent({required this.item});
}
class ChangeResponseEvent extends RatingEvent {
  final BaseGeneralModel item;
  final ResponseModel response;
  const ChangeResponseEvent({required this.response, required this.item});
}

class AddResponseEvent extends RatingEvent {
  final BaseGeneralModel item;
  final ResponseModel response;
  const AddResponseEvent({required this.response, required this.item});
}
class CheckNetworkEvent extends RatingEvent {}