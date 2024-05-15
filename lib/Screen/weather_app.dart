import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_with_location/model/weather.dart';
import 'package:weather_with_location/weather_widget/weather_body_design.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required this.weatherData});
  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141859),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherData.cityName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Today, ${DateFormat('MMM d, yyyy').format(DateTime.now())} at ${DateFormat('HH:mm').format(DateTime.now())}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                )
              ],
            )),
      ),
      body: WeatherAppBody(
        weatherData: weatherData,
      ),
    );
  }
}
