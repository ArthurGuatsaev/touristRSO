import 'package:my_webapp/weather/data/model.dart';

class ApiClientWeather {
  const ApiClientWeather();
  final String adres = 'http://weather.api';
  Future<List<WeatherModelApi>> getDataWeather({required String plays}) async {
    // request to the weather server;

    // add failure instruction;
    // if (request.statusCode == 200) {
    //   throw LocationRequestFailure().message;
    // }

    return [WeatherModelApi()];
  }
}
