import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/get_started.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffbfcaef),
        body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            if (state is GetStartedState) {
              return const SingleChildScrollView(
                child: GetStarted(),
              );
            } else if (state is WeatherLoadedState) {
              return const WeatherInfoBody();
            } else {
              return const Text("there is an error , please try again");
            }
          },
        ));
  }
}
// 