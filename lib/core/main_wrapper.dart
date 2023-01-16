import 'package:clean_architecture_weather_app/features/feature_weather/presentation/bloc/current_weather_status.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/presentation/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(context)
        .add(LoadCurrentWeatherEvent('Tehran'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.currentWeatherStatus is CurrentWeatherLoading) {
            return const Center(
              child: Text('loading...'),
            );
          } 
           if (state.currentWeatherStatus is CurrentWeatherCompleted) {
            return const Center(
              child: Text('Completed...'),
            );
          }
           if (state.currentWeatherStatus is CurrentWeatherError) {
            return const Center(
              child: Text('Error...'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
