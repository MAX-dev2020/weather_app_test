import 'package:weather_app_test/data/api_client.dart';
import 'package:weather_app_test/data/model.dart';
import 'package:weather_app_test/domain/entities.dart';
import 'package:weather_app_test/domain/repository.dart';

class GetWeatherImpl implements GetWeather {
  @override
  Future<Weather> getTodayWeather() async {
    dynamic response = await ApiClient().get();
    print("DONE");
    return WeatherModel.fromJson(response);
  }
}
