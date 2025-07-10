import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/screens/intro_screens/intro_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, IntroScreen.routeName);
    });
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(AppAssetes.splash, fit: BoxFit.fill),
      ),
    );
  }
}
