import 'package:my_webapp/general/domain/model/general_model.dart';

class MainGeneralModel {
  final List<Restourant> restourants;
  final List<Hotels> hotels;
  final List<Plays> playses;
  final String currentCategory;
  const MainGeneralModel(
      {this.restourants = const [],
      this.hotels = const [],
      this.playses = const [],
      this.currentCategory = ''});
  MainGeneralModel copyWith({
    List<Restourant>? restourants,
    List<Hotels>? hotels,
    List<Plays>? playses,
    String? currentCategory,
  }) {
    return MainGeneralModel(
      restourants: restourants ?? this.restourants,
      hotels: hotels ?? this.hotels,
      playses: playses ?? this.playses,
      currentCategory: currentCategory ?? this.currentCategory,
    );
  }

  List<BaseGeneralModel> get currentPlaces {
    switch (currentCategory.toCategories) {
      case PlaceCategory.restourants:
        return restourants;
      case PlaceCategory.hotels:
        return hotels;
      case PlaceCategory.places:
        return playses;
      case PlaceCategory.museum:
        return hotels;
    }
  }

  Set<String> get tags {
    Set<String> result = {};
    currentPlaces.map((e) => result.addAll(e.teg));
    return result;
  }
}
