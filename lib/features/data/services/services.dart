import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:Weather/core/errors/failures.dart';
import 'package:Weather/features/data/model/city_model.dart';
import 'package:Weather/features/data/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String key = "c1bae27c60d841a9a19131622230606";
  final String baseurl = "http://api.weatherapi.com/v1/forecast.json";
  WeatherService(this.dio);

  Future<Either<Failure, WeatherModel>> getWeather(
      {required String cityname}) async {
    try {
      Response response = await dio.get("$baseurl?key=$key&q=$cityname&days=3");
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return Right(weatherModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data));
      } else {
        return Left(ServerFailure("No cities found for the given search."));
      }
    }
  }

  Future<Either<Failure, List<CityModel>>> getCity(
      {required String cityname}) async {
    try {
      Response response = await dio.get(
          "https://api.weatherapi.com/v1/search.json?key=c1bae27c60d841a9a19131622230606&q=$cityname");

      List<dynamic> citiesList = response.data;
      List<CityModel> cities = [];
      for (var city in citiesList) {
        cities.add(CityModel.fromJson(city));
      }
      return Right(cities);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data));
      } else {
        // Handle other types of errors
        return Left(ServerFailure("No cities found for the given search."));
      }
    }
  }
}
