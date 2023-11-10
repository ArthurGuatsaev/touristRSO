part of 'weather_bloc.dart';

class WeatherState {
  final Map<String, WeatherModel> weather;
  final String failure;
  final WeatherStatus status;
  const WeatherState({this.weather = const {}, this.status = WeatherStatus.initial, this.failure = ''});
  WeatherState copyWith({Map<String, WeatherModel>? weather, WeatherStatus? status, String? failure}) {
    return WeatherState(weather: weather?? this.weather, failure: failure ?? this.failure, status: status ??this.status);
  }
  
}

enum WeatherStatus {
  loading, initial, sucsess, noNetwork
}