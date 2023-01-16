part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class LoadCurrentWeatherEvent extends WeatherEvent {
  final String cityName;

   LoadCurrentWeatherEvent(this.cityName);
}

// class LoadForcastWeatherEvent extends WeatherEvent {
//   final String cityName;

//   const LoadForcastWeatherEvent(this.cityName);
// }