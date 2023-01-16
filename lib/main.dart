import 'package:clean_architecture_weather_app/core/main_wrapper.dart';
import 'features/feature_weather/presentation/bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'locator.dart';

void main() async {
  /// init locator
  await setup();

  /// run app
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=> locator<WeatherBloc>()),          
        ],
        child: const MainWrapper(),
      ),
    ),
  );
}
