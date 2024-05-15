import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_with_location/model/weather.dart';
import 'package:weather_with_location/service/location.dart';
import 'package:weather_with_location/service/weather_api.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final LocationService _locationService;
  final WeatherService _weatherService;
  WeatherCubit(this._locationService, this._weatherService)
      : super(WeatherLoadingState());

  Future<void> fetchWeatherUpdate() async {
    try {
      final locationData = await _locationService.determinePosition();
      final weatherData = await _weatherService.getWeather(
          lat: locationData.latitude.toStringAsFixed(2),
          lon: locationData.longitude.toStringAsFixed(2));
      if (weatherData != null) {
        emit(WeatherLoadedState(weatherData: weatherData));
      }
    } catch (e) {
      emit(WeatherErrorState(
          errorMessage: e.toString(), timeStamp: DateTime.now()));
    }
  }
}
