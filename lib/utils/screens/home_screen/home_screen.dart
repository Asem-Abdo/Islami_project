import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/screens/home_screen/tabs/ahadith_tab.dart';
import 'package:islami/utils/screens/home_screen/tabs/quran_tab.dart';
import 'package:islami/utils/screens/home_screen/tabs/radio_tab.dart';
import 'package:islami/utils/screens/home_screen/tabs/sebha_tab.dart';
import 'package:islami/utils/screens/home_screen/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: tabs[selectedIndex],
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      onTap: (index) {
        selectedIndex = index;
        setState(() {});
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: buildBottomNavBarIcon(
            AssetImage(AppAssetes.ic_quran),
            selectedIndex == 0,
          ),
          label: 'Quran',
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavBarIcon(
            AssetImage(AppAssetes.ic_hadith),
            selectedIndex == 1,
          ),
          label: 'Hadith',
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavBarIcon(
            AssetImage(AppAssetes.ic_sebha),
            selectedIndex == 2,
          ),
          label: 'Sebha',
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavBarIcon(
            AssetImage(AppAssetes.ic_radio),
            selectedIndex == 3,
          ),
          label: 'Radio',
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavBarIcon(
            AssetImage(AppAssetes.ic_time),
            selectedIndex == 4,
          ),
          label: 'Time',
        ),
      ],
    );
  }
}

Widget buildBottomNavBarIcon(AssetImage assetsImage, bool isSelected) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? AppColors.blackWithOpacity60 : Colors.transparent,
      borderRadius: BorderRadius.circular(66),
    ),
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
    child: ImageIcon(assetsImage),
  );
}
