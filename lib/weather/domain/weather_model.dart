class WeatherModel {
  final double _temperature;
  final WeatherCondition _condition;
  final DateTime sunrise;
  final DateTime sunset;
  const WeatherModel({required double temperature, required WeatherCondition condition, required this.sunrise, required this.sunset}) : _condition = condition, _temperature = temperature;
  WeatherModel.empty() : _temperature = 9.9, _condition = WeatherCondition.rainy, sunrise = DateTime(2922, 2, 2, 2, 12, 12), sunset = DateTime(2222, 12, 2, 2, 22, 22);
  double get temperature => _temperature;
  WeatherCondition get condition => _condition;
}
enum WeatherCondition {
  sunny, warm, snow, rainy, windy
}