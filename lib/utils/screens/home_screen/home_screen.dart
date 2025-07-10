import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavagationBar(),
      body: Container(),
    );
  }

  Widget buildBottomNavagationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssetes.ic_quran)),
          label: 'Quran',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssetes.ic_hadith)),
          label: 'Hadith',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssetes.ic_sebha)),
          label: 'Sebha',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssetes.ic_radio)),
          label: 'Radio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssetes.ic_time)),
          label: 'Time',
        ),
      ],
    );
  }
}
