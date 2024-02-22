import 'package:flutter/material.dart';
import 'package:weather_app_test/data/repository_impl.dart';
import 'package:weather_app_test/domain/entities.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({super.key});

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  Future<Weather>? weather;
  @override
  void initState() {
    weather = GetWeatherImpl().getTodayWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCDECFC),
      ),
      backgroundColor: const Color(0xFFCDECFC),
      body: FutureBuilder(
          future: weather,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/images/big_cloud.png')],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("July 25, 2024"),
                          Text("Bangalore, India"),
                        ],
                      ),
                      Text("24 C")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Image.asset('assets/images/small_cloud.png')],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Image.asset('assets/images/Sun.png')],
                ),
                const Spacer(flex: 1),
                const Column(
                  children: [
                    Text("THURSDAY"),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("SUNNY"),
                    ),
                  ],
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.only(left: 29.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/girl_walk.png',
                        alignment: Alignment.bottomLeft,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/Meadows.png',
                  alignment: Alignment.topLeft,
                )
              ],
            );
          }),
    );
  }
}
