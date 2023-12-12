import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String key = "c1bae27c60d841a9a19131622230606";
  final String baseurl = "http://api.weatherapi.com/v1/forecast.json";
  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String cityname}) async {
    try {
      Response response = await dio.get("$baseurl?key=$key&q=$cityname&days=3");
      //http://api.weatherapi.com/v1/forecast.json?key=c1bae27c60d841a9a19131622230606&q=London&days=3&aqi=no&alerts=no

      if (response.statusCode == 200) {
        WeatherModel weatherModel = WeatherModel.fromjson(response.data);
        return weatherModel;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
