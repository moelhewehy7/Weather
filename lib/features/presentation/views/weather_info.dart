import 'package:Weather/features/presentation/views/failure_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Weather/features/presentation/views/getstarted.dart';
import 'package:Weather/features/presentation/widgets/weather_info_body.dart';
import '../manager/cubits/get_weather_cubit/get_weather_cubit.dart';
import '../manager/cubits/get_weather_cubit/get_weather_states.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Scaffold(
            body: WeatherInfoBody(weathermodel: state.weatherModel),
          );
        } else if (state is WeatherInitState) {
          return const GetStarted();
        } else if (state is WeatherFailureState) {
          return FailureView(
            errMessage: state.errMessage,
          );
        } else {
          return Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF103554)), // Change color to blue
                strokeWidth: 2, // Increase the thickness of the indicator
              ),
            ),
          );
        }
      },
    );
  }
}
