import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/common/widgets/reusable_text.dart';
import 'package:project1/common/widgets/width_spacer.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles(
      {super.key, required this.text, required this.text2, this.color});
  final String text;
  final String text2;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: (context, ref, child) {
              return Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  color: AppConst.kGreen,
                ),
              );
            }),
            const WidthSpacer(wdith: 15),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReUsableText(
                      text: text,
                      style: appstyle(20, AppConst.kBkDark, FontWeight.bold)),
                  const HeightSpacer(height: 10),
                  ReUsableText(
                      text: text2,
                      style: appstyle(10, AppConst.kBkDark, FontWeight.normal))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
