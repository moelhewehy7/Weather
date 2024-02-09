import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/views/search_page.dart';
import 'package:extended_image/extended_image.dart';

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
    return Stack(children: [
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(), SizedBox(width: width * .10),
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
            SizedBox(
              height: height * .12,
            ),
            Row(
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
                SizedBox(
                    width: width *
                        .01), // Adjust the space between the temperature and '°C'
                Transform.translate(
                  offset: const Offset(
                      0, -40), // Adjust the offset to move the '°C' higher
                  child: const Text(
                    '°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    weathermodel.weatherStateName,
                    style: const TextStyle(
                      fontSize: 25,
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
                height: height * .11,
                width: width * .9,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(203, 0, 0, 0),
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
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              '°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ExtendedImage.network("https:${weathermodel.image}",
                        fit: BoxFit.cover, cache: true,
                        loadStateChanged: (ExtendedImageState state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.completed:
                          return state.completedWidget;
                        case LoadState.failed:
                          return const Icon(Icons.error);
                        case LoadState.loading:
                      }
                      return null;
                    }),
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
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              '°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
    ]);
  }
}
// The Center widget inside the Expanded widget is used to horizontally center the text within the available space.
//  The Expanded widget allows its child (Center in this case) to take up all the remaining space along the row.