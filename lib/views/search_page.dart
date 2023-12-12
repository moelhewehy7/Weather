import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 73, 73),
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: const Color.fromARGB(255, 73, 73, 73),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
          onFieldSubmitted: (value) async {
            var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
            getweathercubit.getWeather(cityname: value);

            Navigator.of(context).pop();
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

WeatherModel? weathermodel;
// WeatherModel? weathermodel; // Declaration
// weathermodel = WeatherModel(); // Instantiation
// Yes, that's correct! If the getWeather method returns the city name
// (for example, "London") and the WeatherModel class has a property named cityname,
//  then assigning the result of getWeather to an instance of WeatherModel would indeed populate the cityname
