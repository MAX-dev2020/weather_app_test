import 'package:weather_app_test/domain/entities.dart';

class WeatherModel extends Weather {
  WeatherModel(
      {required super.epouchDate,
      required super.country,
      required super.weatherMain,
      required super.temp});

  factory WeatherModel.fromJson(Map<String, dynamic> jsonMap) {
    return WeatherModel(
      epouchDate: jsonMap['dt'] ?? '',
      country: jsonMap['sys']['country'] ?? '',
      weatherMain: jsonMap['main'] ?? '',
      temp: jsonMap['temp'] ?? '',
    );
  }
}
