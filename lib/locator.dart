import 'package:clean_architecture_weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/data/repsitory/weather_repository_impl.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/usecase/get_current_weather_usecase.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/presentation/bloc/weather_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  /// apiProvider
  locator.registerSingleton<ApiProvider>(ApiProvider());

  /// repositories
  locator.registerSingleton<WheatherRepository>(
      WeatherRepositoryImpl(apiProvider: locator()));

  /// usecase
  locator.registerSingleton<GetCurrentWeatherUsecase>(
      GetCurrentWeatherUsecase(wheatherRepository: locator()));

  /// bloc
  locator.registerSingleton<WeatherBloc>(WeatherBloc(getCurrentWeatherUsecase: locator()));
}
