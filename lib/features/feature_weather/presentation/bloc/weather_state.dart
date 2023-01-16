part of 'weather_bloc.dart';

 // ignore: must_be_immutable
 class WeatherState {
  CurrentWeatherStatus currentWeatherStatus ;
  WeatherState({required this.currentWeatherStatus});
  
  WeatherState copyWith ({ CurrentWeatherStatus? newCurrentWeatherStatus}){
    // ignore: unnecessary_this
    return WeatherState(currentWeatherStatus: newCurrentWeatherStatus ?? this.currentWeatherStatus);
  }
}

