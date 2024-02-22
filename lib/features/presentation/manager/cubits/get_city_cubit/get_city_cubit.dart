import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Weather/features/presentation/manager/cubits/get_city_cubit/get_city_states.dart';
import 'package:Weather/features/data/services/services.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityInitState());

  Future<void> getcity({required String cityname}) async {
    if (cityname.isEmpty) {
      emit(CityFailureState(
        errMessage: 'Please Start Searching',
      ));
      return; // to Exit the function early if the city name is empty
    }

    emit(CityloadingState());

    var result = await WeatherService(Dio()).getCity(cityname: cityname);
    result.fold((failure) {
      emit(CityFailureState(errMessage: failure.errorMessage));
    }, (cityModel) => emit(CityLoadedState(cityModel: cityModel)));
  }
}
