import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_with_location/model/weather.dart';
import 'package:weather_with_location/model/weather_status.dart';
import 'package:weather_with_location/utils/helper/app_helper.dart';
import 'package:weather_with_location/utils/text_design.dart';
import 'package:weather_with_location/weather_widget/weather_info.dart';
import 'package:weather_with_location/weather_widget/weather_info_box.dart';

class WeatherAppBody extends StatefulWidget {
  const WeatherAppBody({super.key, required this.weatherData});
  final WeatherModel weatherData;

  @override
  State<WeatherAppBody> createState() => _WeatherAppBodyState();
}

class _WeatherAppBodyState extends State<WeatherAppBody> {
  List<WeatherStatusModel> get weatherStatus {
    return [
      WeatherStatusModel(
          title: 'Min temp',
          amountWeather:
              '${widget.weatherData.main.tempMin.toStringAsPrecision(3)}°',
          icon: CupertinoIcons.thermometer),
      WeatherStatusModel(
          title: 'Max temp',
          amountWeather:
              '${widget.weatherData.main.tempMax.toStringAsPrecision(3)}°',
          icon: CupertinoIcons.thermometer),
      WeatherStatusModel(
          title: 'Wind Speed',
          amountWeather: '${widget.weatherData.wind.speed}',
          icon: CupertinoIcons.wind),
      WeatherStatusModel(
          title: 'Humidity',
          amountWeather: '${widget.weatherData.main.humidity}%',
          icon: CupertinoIcons.wind_snow)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(
                        AppHelperFunction.getIcon(
                            widget.weatherData.weather.first.description),
                        color: Colors.white,
                        size: 60,
                      ),
                      Text(
                        widget.weatherData.weather.first.main,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 28),
                      )
                    ],
                  ),
                  Text(
                    '${widget.weatherData.main.temp.toStringAsPrecision(2)}°',
                    style: TextDesign.headlineLarge,
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Image.network(
                  "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png"),
              const SizedBox(
                height: 20,
              ),
              WeatherInfoBox(
                  child: WeatherInfo(
                weatherStatusList: weatherStatus,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
