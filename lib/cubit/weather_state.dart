part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherData;

  const WeatherLoadedState({required this.weatherData});
  @override
  List<Object> get props => [weatherData];
}

final class WeatherErrorState extends WeatherState {
  final String errorMessage;
  final DateTime timeStamp;

  const WeatherErrorState({
    required this.errorMessage,
    required this.timeStamp,
  });

  @override
  List<Object> get props => [errorMessage, timeStamp];
}
