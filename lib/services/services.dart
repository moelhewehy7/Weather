import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String key = "c1bae27c60d841a9a19131622230606";
  final String baseurl = "http://api.weatherapi.com/v1/forecast.json";
  WeatherService(this.dio);

  Future<Either<Failure, WeatherModel>> getWeather(
      {required String cityname}) async {
    try {
      Response response = await dio.get("$baseurl?key=$key&q=$cityname&days=3");

      if (response.statusCode == 200) {
        WeatherModel weatherModel = WeatherModel.fromjson(response.data);
        return Right(weatherModel);
      } else {
        return Left(ServerFailure('Failed to load weather data'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data));
      } else {
        return left(ServerFailure("No cities found for the given search."));
      }
    }
  }
}
