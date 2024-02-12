import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/presentation/views/getstarted.dart';
import 'package:weather_app/features/presentation/widgets/weather_info_body.dart';

import '../manager/cubits/get_weather_cubit/get_weather_cubit.dart';
import '../manager/cubits/get_weather_cubit/get_weather_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return WeatherInfoBody(weathermodel: state.weatherModel);
        } else if (state is WeatherInitState) {
          return const GetStarted();
        } else if (state is WeatherFailureState) {
          return Center(
            child: Text(
              state.errMessage,
              style: TextStyle(fontSize: 18, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

//


