class LocationRequestFailure implements Exception{
  final String message = 'location not found';
}
class LocationNotFailure implements Exception{}
class WeatherRequestFailure implements Exception{}