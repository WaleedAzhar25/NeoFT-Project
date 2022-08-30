import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';
import 'package:page_transition/page_transition.dart';

import 'onBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: primaryColor,
      duration: 2500,
      splash: "assets/images/logo.png",
      splashIconSize: 150,
      nextScreen:const OnBoarding(),
      pageTransitionType: PageTransitionType.bottomToTop,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}