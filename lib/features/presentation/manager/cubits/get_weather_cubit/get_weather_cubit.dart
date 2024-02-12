import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/presentation/manager/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/features/data/services/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitState()) {
    getLastSearchedCity();
  }

  String? lastSearchedCity;

  Future<void> getWeather({required String cityname}) async {
    emit(WeatherloadingState());
    saveLastSearchedCity(cityname);
    var result = await WeatherService(Dio()).getWeather(cityname: cityname);

    result.fold((failure) {
      emit(WeatherFailureState(errMessage: failure.errorMessage));
    }, (cityModel) => emit(WeatherLoadedState(weatherModel: cityModel)));
  }

  Future<void> saveLastSearchedCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastSearchedCity', cityName);
  }

  Future<void> getLastSearchedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    lastSearchedCity = prefs.getString('lastSearchedCity');

    if (lastSearchedCity != null) {
      // If a last searched city is found, fetch weather data for it
      await getWeather(cityname: lastSearchedCity!);
    }
  }
}


// Initialization: In the constructor of the WeatherCubit,
//  the getLastSearchedCity method is called to load the last searched city when the cubit is created. 
// This ensures that the last searched city is loaded and available for use.

// Saving Last Searched City: The saveLastSearchedCity method is responsible for
//  saving the last searched city in SharedPreferences. 
// It takes the city name as a parameter and uses SharedPreferences to store it.

// Retrieving Last Searched City: The getLastSearchedCity method retrieves
//  the last searched city from SharedPreferences. 
// It initializes the lastSearchedCity variable with the value stored in 
// SharedPreferences and then fetches weather data for that city if it exists.