import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
// bloc provider.of called with a context dosnt conaint a getweathercubit 
// The error you're encountering with BlocProvider.of usually happens
//  when the context used to access the bloc isn't within the scope of where the bloc is provided.
//  Ensure that the BlocProvider widget is above the widget 
//  where you're trying to access the GetWeatherCubit. It should look something like this in notes