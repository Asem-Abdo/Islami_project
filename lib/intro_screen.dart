import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_text_style.dart';
import 'package:islami/utils/intro_screen_m.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/IntroScreen";
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.symmetric(horizontal: 69.5),
                  width: 291,
                  child: Image.asset(AppAssetes.islamiName),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Image.asset(screens[currentIndex].midImage),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  screens[currentIndex].text1,
                  style: AppTextStyle.gold24Bold,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    textAlign: TextAlign.center,
                    screens[currentIndex].text2,

                    style: AppTextStyle.gold20Bold,
                  ),
                ),
              ],
            ),
          ),

          ///////////////////////////////////////
          ///////////////////////////////////////
          ///////////////////////////////////////
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  if (currentIndex != 0)
                    TextButton(
                      onPressed: () {
                        previousScreen();
                      },
                      child: Text("Back", style: AppTextStyle.gold16Bold),
                    ),
                  Spacer(),
                  Row(
                    children: List.generate(screens.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == currentIndex ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              index == currentIndex
                                  ? AppColors.gold
                                  : AppColors.whiteGray,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  Spacer(),

                  TextButton(
                    onPressed: () {
                      nextScreen();
                    },
                    child: Text(
                      currentIndex == screens.length - 1 ? "Finish" : "Next",
                      style: AppTextStyle.gold16Bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void nextScreen() {
    if (currentIndex >= 0 && currentIndex < screens.length - 1) {
      currentIndex++;
      setState(() {});
    }
  }

  void previousScreen() {
    if (currentIndex > 0 && currentIndex <= screens.length - 1) {
      currentIndex--;
      setState(() {});
    }
  }
}

List<IntroScreenM> screens = [
  IntroScreenM(
    midImage: AppAssetes.welcome,
    text1: "Welcome to Islami App",
    text2: "",
  ),
  IntroScreenM(
    midImage: AppAssetes.kaaba,
    text1: "Welcome To Islami",
    text2: "We Are Very Excited To Have You In Our Community",
  ),
  IntroScreenM(
    midImage: AppAssetes.moshaf,
    text1: "Reading the Quran",
    text2: "Read, and your Lord is the Most Generous",
  ),
  IntroScreenM(
    midImage: AppAssetes.tsbeh,
    text1: "Bearish",
    text2: "Praise the name of your Lord, the Most High",
  ),
  IntroScreenM(
    midImage: AppAssetes.radio,
    text1: "Holy Quran Radio",
    text2:
        "You can listen to the Holy Quran Radio through the application for free and easily",
  ),
];
