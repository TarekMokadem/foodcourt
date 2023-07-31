import 'package:flutter/material.dart';
import 'package:foodcourt/constants/assets_constant.dart';
import 'package:foodcourt/screens/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        Get.offAllNamed(OnboardingScreen.routeName);
        // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(width: MediaQuery.of(context).size.width*0.4,
          child: Image.asset(Assets.slashImg),
        ),
      ),
    );
  }
}
