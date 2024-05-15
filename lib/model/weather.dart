class WeatherModel {
  Coord coord;
  List<Weather> weather;
  WeatherMainInfo main;
  Wind wind;
  String cityName;

  WeatherModel({
    required this.coord,
    required this.weather,
    required this.main,
    required this.wind,
    required this.cityName,
  });

  factory WeatherModel.formJson(Map<String, dynamic> json) {
    return WeatherModel(
        coord: Coord.fromJson(json['coord']),
        weather: (json['weather'] as List)
            .map((weatherValue) => Weather.fromJson(weatherValue))
            .toList(),
        main: WeatherMainInfo.fromJson(json['main']),
        wind: Wind.fromJson(json['wind']),
        cityName: json['name']);
  }
}

class Coord {
  double lon;
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(lon: json['lon'], lat: json['lat']);
  }
}

class WeatherMainInfo {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  double pressure;
  int humidity;

  WeatherMainInfo({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherMainInfo.fromJson(Map<String, dynamic> json) {
    return WeatherMainInfo(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'],
    );
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}

class Wind {
  double speed;
  int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed'], deg: json['deg']);
  }
}
