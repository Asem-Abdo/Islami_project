import 'package:flutter/material.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_text_style.dart';

class SuraRaw extends StatelessWidget {
  final SuraDM sura;
  const SuraRaw({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          buildIndexImage(),
          SizedBox(width: 24),
          Expanded(child: buildNameEn()),
          buildNameAr(),
        ],
      ),
    );
  }

  buildIndexImage() => Container(
    alignment: Alignment.center,
    width: 52,
    height: 52,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(AppAssetes.coverOfNumber)),
    ),
    child: Text(sura.index.toString(), style: AppTextStyle.wight14Bold),
  );

  buildNameEn() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(sura.nameEn, style: AppTextStyle.wight20Bold),
      Text("${sura.verses} Verses", style: AppTextStyle.wight14Bold),
    ],
  );

  buildNameAr() => Text(sura.nameAr, style: AppTextStyle.wight20Bold);
}
