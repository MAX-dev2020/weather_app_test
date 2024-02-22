import 'package:weather_app_test/data/api_client.dart';
import 'package:weather_app_test/domain/entities.dart';
import 'package:weather_app_test/domain/repository.dart';

class GetWeatherImpl implements GetWeather {
  @override
  Future<Weather> getTodayWeather() async {
    dynamic response = await ApiClient().get();
    return Weather(
        epouchDate: 1708622116,
        country: "Bangalore",
        weatherMain: "sunny",
        temp: 23.2);
  }
}
