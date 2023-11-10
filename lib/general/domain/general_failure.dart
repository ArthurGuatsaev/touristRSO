class HttpRequestFailedException implements Exception {
  final String message;
  const HttpRequestFailedException({required this.message});
}
class HiveFailedException implements Exception {
  final String message;
  const HiveFailedException({required this.message});
}

class DateTimeParsingException implements Exception {
  final String message;
  const DateTimeParsingException({required this.message});
}