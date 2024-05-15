import 'package:flutter/cupertino.dart';

class WeatherStatusModel {
  String title;
  String amountWeather;
  IconData icon;
  WeatherStatusModel({
    required this.title,
    required this.amountWeather,
    required this.icon,
  });
}
