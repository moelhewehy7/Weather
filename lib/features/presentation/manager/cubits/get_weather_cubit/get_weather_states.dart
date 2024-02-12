import 'package:weather_app/features/data/model/weather_model.dart';

class WeatherState {}

class WeatherInitState extends WeatherState {}

class WeatherloadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState({required this.errMessage});
}
