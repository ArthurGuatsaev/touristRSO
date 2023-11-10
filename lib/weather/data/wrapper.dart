import 'package:my_webapp/weather/data/model.dart';
import 'package:my_webapp/weather/domain/weather_model.dart';

class WeatherWrapper {
  const WeatherWrapper();

  static Map<String, WeatherModel> wrapWeather(List<WeatherModelApi> plays) {
    final Map<String, WeatherModel> res = {};
    for (var i = 0; i < plays.length; i++) {
      res['${DateTime.now().subtract(Duration(days: i)).day}'] =
          plays[i].toWeather();
    }
    return res;
  }
}
