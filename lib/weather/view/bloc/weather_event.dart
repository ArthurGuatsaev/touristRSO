part of 'weather_bloc.dart';
abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String plays;
  GetWeatherEvent({required this.plays});
}