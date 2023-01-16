import 'package:clean_architecture_weather_app/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  var apikey = Constants.apiKeys1;

  /// current weather api call
  /// 
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get(
      '${Constants.baseUrl}/data/2.5/weather',
       queryParameters: {
        'q' : cityName,
        'appid' : apikey,
        'units' : 'meteric'
       }
    );
    return response;
  }
}
