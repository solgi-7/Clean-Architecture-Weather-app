import 'package:bloc/bloc.dart';
import 'package:clean_architecture_weather_app/core/resources/data_state.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/usecase/get_current_weather_usecase.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/presentation/bloc/current_weather_status.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;

  WeatherBloc({required this.getCurrentWeatherUsecase}) : super(WeatherState(currentWeatherStatus: CurrentWeatherLoading())) {
    
    on<LoadCurrentWeatherEvent>((event, emit) async {

      emit(state.copyWith(newCurrentWeatherStatus: CurrentWeatherLoading()));

      DataState dataState = await getCurrentWeatherUsecase(event.cityName);

      if (dataState is DataSuccess){
        emit(state.copyWith(newCurrentWeatherStatus: CurrentWeatherCompleted(dataState.data)));
 
      }
       if (dataState is DataFailed){
        emit(state.copyWith(newCurrentWeatherStatus: CurrentWeatherError(dataState.error!)));

      }
    });
  }
}
