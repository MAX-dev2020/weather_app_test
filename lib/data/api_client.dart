import 'package:dio/dio.dart';

class ApiClient {
  Future<dynamic> get() async {
    try {
      final dio = Dio();
      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=12.9978608&lon=77.5275458&appid=d49ec9c1918eff5b0dd5fd8cf9efa94c');
      print("$response");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
