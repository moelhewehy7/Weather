import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Weather/features/presentation/manager/cubits/get_city_cubit/get_city_cubit.dart';
import 'package:Weather/features/presentation/manager/cubits/get_city_cubit/get_city_states.dart';
import 'package:Weather/features/presentation/manager/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:Weather/features/data/model/city_model.dart';
import 'package:Weather/features/presentation/views/home_view.dart';

class SearchResultListTile extends StatelessWidget {
  const SearchResultListTile({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
      builder: (context, state) {
        if (state is CityLoadedState) {
          return ResultListView(
            height: height,
            citymodel: state.cityModel,
          );
        } else if (state is CityFailureState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        } else if (state is CityInitState) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please Start Searching',
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        } else {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Searching',
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        }
      },
    );
  }
}

class ResultListView extends StatelessWidget {
  const ResultListView({
    super.key,
    required this.citymodel,
    required this.height,
  });
  final List<CityModel> citymodel;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: height * .70,
        child: ListView.builder(
          // Allow ListView to adapt its height
          itemCount: citymodel.length,
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityname: citymodel[i].name);
                animatednavigation(context);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 8, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // City and Country
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          citymodel[i].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                            height: 4), // Add some space between the texts
                        Text(
                          overflow: TextOverflow.ellipsis,
                          citymodel[i].country,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    // Temperature
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(cityname: citymodel[i].name);
                        animatednavigation(context);
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                    // Image
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> animatednavigation(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
}
