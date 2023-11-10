import 'package:my_webapp/weather/data/api_util.dart';
import 'package:my_webapp/weather/data/failure.dart';
import 'package:my_webapp/weather/domain/weather_domain.dart';
import 'package:my_webapp/weather/domain/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final BaseWeatherRepository _repository;
  WeatherBloc({BaseWeatherRepository? repository})
      : _repository = repository ?? const ApiUtil(),
        super(const WeatherState()) {
    on<GetWeatherEvent>(onTest);
  }
  onTest(GetWeatherEvent event, Emitter<WeatherState> emit) async {
    try {
      if (_repository is ApiUtil) {
        //check network if(no) return emit(state.copyWith(status: WeatherStatus.noNetwork))
        final weather =
            await (_repository as ApiUtil).getWeather(plays: event.plays);
        emit(state.copyWith(weather: weather));
      }
    } on LocationRequestFailure catch (e) {
      emit(state.copyWith(failure: e.message));
    }
  }
}
