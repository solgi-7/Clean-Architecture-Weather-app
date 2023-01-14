import 'package:clean_architecture_weather_app/core/main_wrapper.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/data/repsitory/weather_repository_impl.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/usecase/get_current_weather_usecase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetCurrentWeatherUsecase getCurrentWeatherUsecase = GetCurrentWeatherUsecase(WeatherRepositoryImpl(apiProvider: ApiProvider()));
    
    getCurrentWeatherUsecase.execute('tehran');

    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}

