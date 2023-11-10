class RatingModel {
  final Map<String, double> _rating;
  final Set<String> _ratingHistory;
  final List<Map<String, String>> _resposes;
  Map<String, double> get rating => _rating;
  const RatingModel({required Map<String, double> rating, required Set<String> ratingHistory, required List<Map<String, String>> responses}) : _rating = rating, _ratingHistory = ratingHistory, _resposes = responses;
  const RatingModel.empty({Map<String, double> rating = const {}, Set<String> ratingHistory = const {}, List<Map<String, String>> responses = const []}) : _rating = rating, _ratingHistory = ratingHistory, _resposes = responses;
  RatingModel copyWith({Map<String, double>? rating, Set<String>? ratingHistory, List<Map<String, String>>? responses}) {
    return RatingModel(rating: rating ?? _rating, ratingHistory: ratingHistory ?? _ratingHistory, responses: responses ?? _resposes);
  }
}