import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_text_style.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tsabih = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int indexTasbih = 0;
  int countTasbih = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssetes.backGroundSebha,
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 69,
                left: 70,
                bottom: 16,
              ),
              child: Image.asset(AppAssetes.logoIslami),
            ),
            Text(
              textAlign: TextAlign.center,
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: AppTextStyle.arabi36Bold,
            ),
            SizedBox(height: 16),
            SizedBox(height: 86, child: Image.asset(AppAssetes.sebhaSmallBody)),
            InkWell(
              onTap: () {
                tsbih();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: angle,
                    child: Image.asset(AppAssetes.sebhaBody),
                  ),

                  Column(
                    children: [
                      Text(
                        tsabih[indexTasbih],
                        style: AppTextStyle.arabi36Bold,
                      ),
                      Text("$countTasbih", style: AppTextStyle.arabi36Bold),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void tsbih() {
    countTasbih++;
    angle += 20;

    if (countTasbih == 33) {
      countTasbih = 0;
      (indexTasbih < 2) ? indexTasbih++ : indexTasbih = 0;
      tsabih[indexTasbih];
    }
    setState(() {});
  }
}
