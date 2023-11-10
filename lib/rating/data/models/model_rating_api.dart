
class ModelRatingApi{
  final Map<String, dynamic> rating;
  const ModelRatingApi({this.rating = const {}});

  factory ModelRatingApi.fromJson({required Map<String, dynamic> json }) {
      return ModelRatingApi(rating: json['rating']);
    }

  Map<String, dynamic> toJsonRating({required ModelRatingApi rat}) {
    return {'rating': rat.rating};
  }
}
class ModelResponseApi{
  final List<dynamic> responses;
  const ModelResponseApi({this.responses = const []});

  factory ModelResponseApi.fromJson({ Map<String, dynamic>? responseApi}) {
      return ModelResponseApi(responses: responseApi?['resposes'] ?? []);
  }

  Map<String, dynamic> toJsonResponse({required ModelResponseApi resp}) {
    return {'responses': resp.responses};
  }
}