import 'package:weather_app_test/domain/entities.dart';

abstract interface class GetWeather {
  Future<Weather> getTodayWeather();
}
