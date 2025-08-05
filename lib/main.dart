import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/screens/home_screen/home_screen.dart';
import 'package:islami/utils/screens/intro_screens/intro_screen.dart';
import 'package:islami/utils/screens/splash_screen/splash_screen.dart';
import 'package:islami/utils/screens/sura_details/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: AppColors.gold),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        IntroScreen.routeName: (_) => IntroScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
      },
    );
  }
}
