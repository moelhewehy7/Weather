import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/services.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetStartedState());
  late WeatherModel weathermodel;
  getWeather({required String cityname}) async {
    try {
      weathermodel = await WeatherService(Dio()).getWeather(cityname: cityname);
      emit(WeatherLoadedState());
    } on Exception {
      emit(WeatherFailureState());
    }
  }
}
