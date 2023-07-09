import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_webapp/data/repositories/places_repository.dart';

import '../../models/places.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlacesRepository _placesRepository;
  PlacesBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(const PlacesState()) {
    on<TakePlacesEvent>(takePlaces);
  }
  takePlaces(TakePlacesEvent event, Emitter<PlacesState> emit) async {
    final places = await _placesRepository.takePlaces();
    emit(state.copyWith(places: places));
  }
}
