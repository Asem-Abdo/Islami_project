import 'package:flutter/material.dart';
import 'package:islami/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {IntroScreen.routeName: (_) => IntroScreen()},
    );
  }
}
