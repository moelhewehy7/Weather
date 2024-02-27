import 'package:Weather/features/presentation/views/weather_info.dart';
import 'package:flutter/material.dart';

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
        return const WeatherInfo();
      },
    ),
  );
}
