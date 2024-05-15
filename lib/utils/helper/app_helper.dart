import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';

class AppHelperFunction {
  static IconData getIcon(String weatherCase) {
    switch (weatherCase) {
      case 'clear sky':
        return CupertinoIcons.sun_max_fill;
      case 'few clouds':
        return CupertinoIcons.cloud_sun;
      case 'scattered clouds':
        return CupertinoIcons.cloud;
      case 'broken clouds':
        return CupertinoIcons.smoke;
      case 'shower rain':
        return CupertinoIcons.cloud_rain;
      case 'rain':
        return CupertinoIcons.cloud_rain;
      case 'thunderstorm':
        return CupertinoIcons.cloud_bolt_rain;
      case 'snow':
        return CupertinoIcons.snow;
      default:
        return CupertinoIcons.wind_snow;
    }
  }

  static Future<String?> getCityName(
      {required double lat, required double lon}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    return placemarks.first.locality;
  }
}
