import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_text_style.dart';
import 'package:islami/utils/constants.dart';
import 'package:islami/utils/screens/quran/sura_raw.dart';
import 'package:islami/utils/screens/sura_details/sura_details.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssetes.backGroundQuran),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          logoIslami(),
          searchbar(),
          mostRecently(),
          Expanded(child: surasList()),
        ],
      ),
    );
  }

  logoIslami() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 67, right: 64, bottom: 21),
      child: Image.asset(AppAssetes.logoIslami),
    );
  }

  searchbar() {
    var defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold),
      borderRadius: BorderRadius.circular(10),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(color: AppColors.blackWithOpacity60),
        child: TextField(
          onTap: () {},
          style: AppTextStyle.wight16Bold,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),

            border: defaultBorder,
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
            labelText: "Sura Name",
            labelStyle: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            prefixIcon: ImageIcon(
              AssetImage(AppAssetes.ic_quran),

              color: AppColors.gold,
            ),
          ),
          cursorColor: AppColors.gold,
        ),
      ),
    );
  }

  mostRecently() {
    return Container();
  }

  surasList() {
    return ListView.separated(
      separatorBuilder:
          (_, _) => Divider(endIndent: 64, indent: 64, thickness: 2),
      itemCount: AppConstants.suras.length,
      itemBuilder: (context, index) {
        var sura = AppConstants.suras[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              SuraDetails.routeName,
              arguments: sura,
            );
          },
          child: SuraRaw(sura: sura),
        );
      },
    );
  }
}
