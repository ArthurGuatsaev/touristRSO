import 'package:my_webapp/weather/domain/weather_model.dart';

abstract class BaseWeatherRepository {
  Future<Map<String, WeatherModel>> getWeather({required String plays});
  const BaseWeatherRepository();
}
