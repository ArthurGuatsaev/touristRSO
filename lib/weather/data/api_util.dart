import 'package:my_webapp/weather/data/api_client.dart';
import 'package:my_webapp/weather/data/wrapper.dart';
import 'package:my_webapp/weather/domain/weather_domain.dart';
import 'package:my_webapp/weather/domain/weather_model.dart';

class ApiUtil extends BaseWeatherRepository {
  final ApiClientWeather _apiClientWeather;
  const ApiUtil({ApiClientWeather? apiClientWeather})
      : _apiClientWeather = apiClientWeather ?? const ApiClientWeather(),
        super();
  @override
  Future<Map<String, WeatherModel>> getWeather({required String plays}) async {
    final weather = await _apiClientWeather.getDataWeather(plays: plays);
    return WeatherWrapper.wrapWeather(weather);
  }
}
