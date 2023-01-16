import 'package:clean_architecture_weather_app/core/resources/data_state.dart';
import 'package:clean_architecture_weather_app/core/usecase/usecase.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUsecase extends Usecase<DataState<CurrentCityEntity>,String>{
  final WheatherRepository wheatherRepository ;

  GetCurrentWeatherUsecase({required this.wheatherRepository});

  @override
  Future<DataState<CurrentCityEntity>> call(String param) async {
     return wheatherRepository.fetchCurrentWeatherData(param);
  }

}