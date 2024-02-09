import 'package:weather_app/model/weather_model.dart';

class WeatherState {}

class WeatherInitState extends WeatherState {}

class WeatherloadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weathermodel;
  WeatherLoadedState({required this.weathermodel});
}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState({required this.errMessage});
}
