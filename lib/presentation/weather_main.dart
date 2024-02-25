import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_test/data/repository_impl.dart';
import 'package:weather_app_test/domain/entities.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({super.key});

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  Future<Weather> weather = GetWeatherImpl().getTodayWeather();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFCDECFC),
      body: FutureBuilder<Weather>(
        future: weather,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            Weather weatherData = snapshot.data;
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 80.0),
                            child: Image.asset(
                              'assets/images/big_cloud.png',
                              height: queryData.size.height * 0.07,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  weatherData.epouchDate,
                                  style: GoogleFonts.josefinSans().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: queryData.size.width * 0.06),
                                ),
                                Text(
                                  weatherData.country,
                                  style: GoogleFonts.josefinSans().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: queryData.size.width * 0.05),
                                ),
                                Image.asset(
                                  'assets/images/small_cloud.png',
                                  height: queryData.size.height * 0.05,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(weatherData.temp,
                                    style: GoogleFonts.josefinSans().copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: queryData.size.width * 0.12)),
                                Image.asset(
                                  'assets/images/Sun.png',
                                  height: queryData.size.height * 0.13,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: queryData.size.height / 2.3,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("THURSDAY",
                            style: GoogleFonts.josefinSans().copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: queryData.size.width * 0.08)),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          weatherData.weatherMain,
                          style: GoogleFonts.josefinSans().copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: queryData.size.width * 0.06),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/Meadows.png',
                    width: queryData.size.width,
                    height: queryData.size.height * 0.27,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: queryData.size.height * 0.26,
                  left: queryData.size.width * 0.15,
                  child: Image.asset(
                    'assets/images/girl_walk.png',
                    height: queryData.size.height * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
