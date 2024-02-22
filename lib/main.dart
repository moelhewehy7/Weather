import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Weather/features/presentation/manager/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:Weather/features/presentation/views/onboarding_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingView(),
      ),
    );
  }
}
// bloc provider.of called with a context dosnt conaint a getweathercubit 
// The error you're encountering with BlocProvider.of usually happens
//  when the context used to access the bloc isn't within the scope of where the bloc is provided.
//  Ensure that the BlocProvider widget is above the widget 
//  where you're trying to access the GetWeatherCubit. It should look something like this in notes