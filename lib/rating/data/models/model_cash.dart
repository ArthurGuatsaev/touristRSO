class CashRatingModel {
  final Map<String, double> addRating;
  final Map<String, double> changeRating;
  final double newRate;
  final List<String> deleteRating;
  const CashRatingModel({this.addRating = const {},this.newRate = 0.0, this.changeRating = const {}, this.deleteRating = const []});
  CashRatingModel copyWith({
    Map<String, double>? addRating,
    Map<String, double>? changeRating,
    List<String>? deleteRating,
    double? newRate
  }) {
    return CashRatingModel(
      addRating: addRating??this.addRating,
      changeRating: changeRating??this.changeRating,
      deleteRating: deleteRating??this.deleteRating,
      newRate: newRate??this.newRate,
    );
  }
}
class CashResponseModel {
  final List<ResponseModel> addResponse;
  final Map<String, double> changeResponse;
  final List<String> deleteResponse;
  const CashResponseModel({this.addResponse = const [], this.changeResponse = const {}, this.deleteResponse = const []});
  CashResponseModel copyWith({
    List<ResponseModel>? addResponse,
    Map<String, double>? changeResponse,
    List<String>? deleteResponse,
  }) {
    return CashResponseModel(
      addResponse: addResponse??this.addResponse,
      changeResponse: changeResponse??this.changeResponse,
      deleteResponse: deleteResponse??this.deleteResponse,
    );
  }
}

class ResponseModel {
  final Map<String, double> response;
  const ResponseModel({this.response = const {}});
}