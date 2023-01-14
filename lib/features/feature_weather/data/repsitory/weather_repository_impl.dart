// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_weather_app/core/resources/data_state.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/data/models/current_city_model.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:clean_architecture_weather_app/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';

class WeatherRepositoryImpl extends WheatherRepository {
  ApiProvider apiProvider;
  WeatherRepositoryImpl({required this.apiProvider});
  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);
      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);
      } else {
        return const DataFailed('Something Went Wrong . Please try again...');
      }
    } catch (e) {
      return const DataFailed('Please check your internet ...');
    }
  }
}
