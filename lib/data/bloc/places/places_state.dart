// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'places_bloc.dart';

class PlacesState extends Equatable {
  final List<Places> places;
  List<Places> get mainPlaces {
    return places.isEmpty ? [] : [
      places[0],
      places[1],
      places[2],
    ];
  }

  const PlacesState({this.places = const []});

  @override
  List<Object> get props => [places];

  PlacesState copyWith({
    List<Places>? places,
  }) {
    return PlacesState(
      places: places ?? this.places,
    );
  }
}
