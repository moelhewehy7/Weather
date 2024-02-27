import 'package:Weather/features/presentation/manager/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:Weather/features/data/model/weather_model.dart';
import 'package:Weather/features/presentation/views/search_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weathermodel});
  final WeatherModel weathermodel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: WeatherInfoBodyStack(
          height: height, width: width, weathermodel: weathermodel),
    );
  }
}

class WeatherInfoBodyStack extends StatelessWidget {
  const WeatherInfoBodyStack({
    super.key,
    required this.height,
    required this.width,
    required this.weathermodel,
  });

  final double height;
  final double width;
  final WeatherModel weathermodel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2)); // Delay for 1 second
        return BlocProvider.of<WeatherCubit>(context)
            .getWeather(cityname: weathermodel.cityname);
      },
      displacement:
          50, // Set the distance the indicator can be pulled before a refresh is triggered
      color: Color(0xFF0D81E0), // Set the color of the refresh indicator
      backgroundColor: const Color.fromARGB(255, 84, 84,
          84), // Set the background color behind the refresh indicator
      strokeWidth: 3.0, // Set the thickness of the indicator
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(children: [
          SizedBox(
            height: height,
            width: width,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color(0xFF000000).withOpacity(
                    0.28), // Adjust opacity to make it darker or lighter
                BlendMode.srcOver,
              ),
              child: Image.asset(
                weathermodel.getImage(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.035,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(), SizedBox(width: width * .10),
                      Text(
                        weathermodel.cityname,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
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
                SizedBox(
                  height: height * .12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${weathermodel.temp.round()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize:
                              70, // Adjust the size as needed for the temperature
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                          width: width *
                              .01), // Adjust the space between the temperature and '°C'
                      Transform.translate(
                        offset: const Offset(0,
                            -40), // Adjust the offset to move the '°C' higher
                        child: const Text(
                          '°C',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        weathermodel.weatherStateName,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.4),
                Opacity(
                  opacity: 0.8,
                  child: Container(
                    height: height * 0.1,
                    padding: EdgeInsets.only(
                        top: height * 0.02, bottom: height * 0.02),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(203, 0, 0, 0),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Min Temp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${weathermodel.minTemp.round()}°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: height * 0.019,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        ExtendedImage.network(
                          "https:${weathermodel.image}",
                          scale: 1.5,
                          cache: true,
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.completed:
                                return state.completedWidget;
                              case LoadState.failed:
                                return const Icon(Icons.error);
                              case LoadState.loading:
                                return const CircularProgressIndicator(); // Placeholder while loading
                            }
                          },
                        ),
                        Column(
                          children: [
                            const Text(
                              'Max Temp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${weathermodel.maxTemp.round()}°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: height * 0.019,
                                fontWeight: FontWeight.w400,
                              ),
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
        ]),
      ),
    );
  }
}
// The Center widget inside the Expanded widget is used to horizontally center the text within the available space.
//  The Expanded widget allows its child (Center in this case) to take up all the remaining space along the row.