import 'package:clean_architecture_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CurrentWeatherStatus {}

class CurrentWeatherLoading extends CurrentWeatherStatus {}

class CurrentWeatherCompleted extends CurrentWeatherStatus {
  final CurrentCityEntity currentCityEntity;

  CurrentWeatherCompleted(this.currentCityEntity);
}

class CurrentWeatherError extends CurrentWeatherStatus {
  final String message;

  CurrentWeatherError(this.message);
}
