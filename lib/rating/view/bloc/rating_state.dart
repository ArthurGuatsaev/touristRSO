part of 'rating_bloc.dart';

class RatingState {
  final BaseGeneralModel model;
  final String failure;
  final RatingStatus ratingStatus;
  final RatingStatus responseStatus;
  final bool isConnectNet;
  const RatingState({this.model = const BaseGeneralModel.test(), this.isConnectNet = true, this.failure = '', this.ratingStatus = RatingStatus.initial, this.responseStatus = RatingStatus.initial});
  RatingState copyWith({BaseGeneralModel? model, bool? isConnectNet, String? failure, RatingStatus? ratingStatus, RatingStatus? responseStatus}) {
    return RatingState(
      model: model ?? this.model,
      isConnectNet: isConnectNet ?? this.isConnectNet,
      failure: failure ?? this.failure,
      ratingStatus: ratingStatus ?? this.ratingStatus,
      responseStatus: responseStatus ?? this.responseStatus,
    );
  }
  
}


enum RatingStatus {
  sucsess, loading, error, initial, requiredUpdate
}