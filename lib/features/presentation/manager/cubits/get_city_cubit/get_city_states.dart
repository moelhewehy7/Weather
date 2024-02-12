import '../../../../data/model/city_model.dart';

class CityState {}

class CityInitState extends CityState {}

class CityloadingState extends CityState {}

class CityLoadedState extends CityState {
  final List<CityModel> cityModel;
  CityLoadedState({required this.cityModel});
}

class CityFailureState extends CityState {
  final String errMessage;

  CityFailureState({required this.errMessage});
}
