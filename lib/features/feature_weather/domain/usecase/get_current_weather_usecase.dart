import 'package:clean_architecture_weather_app/core/resources/data_state.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUsecase {
  final WheatherRepository wheatherRepository ;

  GetCurrentWeatherUsecase(this.wheatherRepository);

  Future<DataState<CurrentCityEntity>>execute (String cityName) async {
    return await wheatherRepository.fetchCurrentWeatherData(cityName);
  }
}