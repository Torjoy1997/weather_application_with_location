import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/weather.dart';

class WeatherService {
  final String baseURL = "https://api.openweathermap.org/data/2.5/weather";

  Future<WeatherModel?> getWeather(
      {required String lat, required String lon}) async {
    try {
      final response = await http.get(Uri.parse(
          "$baseURL?lat=$lat&lon=$lon&appid=${dotenv.get('weatherAPIkey')}&units=metric"));
      if (response.statusCode == 200) {
        return WeatherModel.formJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      throw e.toString();
    }
  }
}
