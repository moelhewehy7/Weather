import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool onboardingShown = true;
  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      onboardingShown = prefs.getBool('onboardingShown') ?? false;
    });
  }

// If there is no value stored in shared preferences for the key 'onboardingShown',
//onboardingShown is set to false  (indicating that the onboarding has not been shown yet)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: onboardingShown ? const HomeView() : const OnBoardingViewBody());
  }
}
