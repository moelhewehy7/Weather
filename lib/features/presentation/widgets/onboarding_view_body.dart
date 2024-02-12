import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/presentation/views/getstarted.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: IntroductionScreen(
        pages: [
          customPageViewModel(
              title: "Weather Explorer",
              body:
                  'Embark on a journey to explore the ever-changing weather patterns. Dive into meteorological data, track forecasts, and unravel the mysteries of atmospheric phenomena, guiding you through a captivating voyage of discovery and understanding',
              image: Image.asset("assets/images/Weather.gif")),
          customPageViewModel(
              title: "Forecast Insights",
              body:
                  'Delve into comprehensive forecasts and insightful analyses. Navigate through forecast models, interpret meteorological trends, and anticipate weather shifts, guiding you through an enlightening expedition of meteorological insight',
              image: Image.asset("assets/images/Storm.gif")),
          customPageViewModel(
              title: "Climate Chronicles",
              body:
                  'Venture into the realms of climate exploration and understanding. From historical weather data to climatic trends, immerse yourself in a sanctuary offering climatological refuge and endless insights into weather patterns and phenomena',
              image: Image.asset("assets/images/Season change.gif"))
        ],
        globalBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        dotsContainerDecorator: const ShapeDecoration(
          color: Color(0xFF008080), // Replace with your desired color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
        ),
        dotsDecorator: DotsDecorator(
            size: const Size(10.0, 10.0),
            activeSize: const Size(22.0, 10.0),
            color: const Color(0xFFFFFFFF),
            activeColor: const Color(0xFF003333),
            activeShape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(25.0), // Adjust the radius as needed
            )),
        showDoneButton: true,
        done: const Text(
          "Start",
          style: TextStyle(color: Color(0xFFFFFBF7), fontSize: 16),
        ),
        showNextButton: true,
        next: const Icon(Icons.keyboard_arrow_right_outlined,
            color: Color(0xFFFFFBF7)),
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(color: Color(0xFFFFF5EB), fontSize: 16),
        ),
        onDone: () => onDone(context),
      ),
    );
  }

  PageViewModel customPageViewModel({
    required String title,
    required String body,
    required Image image,
  }) {
    return PageViewModel(
        title: title,
        body: body,
        image: image,
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)));
  }

  void onDone(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingShown', true);
// It sets the value of 'onboardingShown' to true in shared preferences
// to indicate that the onboarding has been shown.
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const GetStarted();
    }));
  }
}
