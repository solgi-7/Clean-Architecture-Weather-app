import 'package:clean_architecture_weather_app/core/resources/data_state.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';

abstract class WheatherRepository {

  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);
  
}
