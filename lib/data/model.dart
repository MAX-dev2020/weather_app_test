import 'package:weather_app_test/domain/entities.dart';

class WeatherModel extends Weather {
  WeatherModel(
      {required super.epouchDate,
      required super.country,
      required super.weatherMain,
      required super.temp});

  factory WeatherModel.fromJson(Map<String, dynamic> jsonMap) {
    try {
      return WeatherModel(
        epouchDate: DateTime.fromMillisecondsSinceEpoch(jsonMap['dt'] * 1000)
            .toString()
            .substring(0, 10),
        country: jsonMap['sys']['country'],
        weatherMain: jsonMap['weather'][0]['main'],
        temp: "${((jsonMap['main']['temp'] - 32 * 5) / 9).round()}\u2103",
      );
    } catch (e) {
      print("regardig String $e");
      return WeatherModel(
        epouchDate: "67",
        country: 'Ran',
        weatherMain: "sd",
        temp: "2",
      );
    }
  }
}
