import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/views/search_page.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weathermodel = BlocProvider.of<GetWeatherCubit>(context).weathermodel;
    return Stack(
      children: [
        Image.asset(
          weathermodel.getImage(),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 35,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(), const SizedBox(width: 40),
                    Text(
                      weathermodel.cityname,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const Spacer(), // This will push the IconButton to the end of the row
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                            .push(MaterialPageRoute(builder: (BuildContext) {
                          return const SearchPage();
                        }));
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${weathermodel.temp.round()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize:
                            80, // Adjust the size as needed for the temperature
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                        width:
                            4), // Adjust the space between the temperature and '°C'
                    Transform.translate(
                      offset: const Offset(
                          0, -40), // Adjust the offset to move the '°C' higher
                      child: const Text(
                        '°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              24, // Adjust the size as needed for the '°C'
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      weathermodel
                          .weatherStateName, // Replace with actual weather description
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 355), // Adjust the height as needed
              Opacity(
                opacity: 0.8,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(154, 0, 0, 0),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Min Temp',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${weathermodel.minTemp.round()}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      18, // Adjust the size as needed for the temperature
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      2), // Adjust the space between the temperature and '°C'
                              const Text(
                                '°',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      20, // Adjust the size as needed for the '°C'
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.network("https:${weathermodel.image}"),
                      Column(
                        children: [
                          const Text(
                            'Max Temp',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${weathermodel.maxTemp.round()}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      18, // Adjust the size as needed for the temperature
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      2), // Adjust the space between the temperature and '°C'
                              const Text(
                                '°',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      20, // Adjust the size as needed for the '°C'
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// The Center widget inside the Expanded widget is used to horizontally center the text within the available space.
//  The Expanded widget allows its child (Center in this case) to take up all the remaining space along the row.