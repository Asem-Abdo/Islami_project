import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_text_style.dart';

import '../../app_assets.dart';

class SuraDetails extends StatefulWidget {
  static final String routeName = "SuraDetails";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDM sura;
  String suraContent = "";
  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDM;
    if (suraContent.isEmpty) {
      readSuraContent();
    }
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.gold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(sura.nameEn, style: AppTextStyle.gold20Bold),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage(AppAssetes.bottomDecoration),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssetes.leftCorner),
                  Text(sura.nameAr, style: AppTextStyle.gold24Bold),
                  Image.asset(AppAssetes.rightCorner),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child:
                      suraContent.isEmpty
                          ? CircularProgressIndicator(color: AppColors.gold)
                          : Text(
                            suraContent,
                            style: AppTextStyle.gold20Bold,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future readSuraContent() async {
    String fileName = "assets/files/quran/${sura.index}.txt";
    Future<String> contentFuture = rootBundle.loadString(fileName);
    suraContent = await contentFuture;
    List<String> suraLines = suraContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}]  ";
    }
    suraContent = suraLines.join();
    setState(() {});
  }
}
