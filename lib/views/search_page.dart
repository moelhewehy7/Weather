import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF494949),
      appBar: AppBar(
        backgroundColor: const Color(0xFF494949),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          onFieldSubmitted: (value) async {
            if (value.isNotEmpty) {
              // Save the city name in shared preferences
              await BlocProvider.of<WeatherCubit>(context)
                  .saveLastSearchedCity(value);

              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityname: value);
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 1000),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) {
                    // Return your destination screen widget here
                    return const HomeView();
                  },
                ),
              );
            }
          },

          style: const TextStyle(
              color: Colors.white), // Set the color of the user input text
          decoration: InputDecoration(
            hintText: "Search City",
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.7)), // Hint text color
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.grey)),
            filled: true,
            fillColor: const Color.fromARGB(255, 47, 46, 46),
          ),
        ),
      ),
    );
  }
}
