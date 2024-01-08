import 'package:flutter/widgets.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/reusable_text.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      this.onTap,
      required this.width,
      required this.height,
      this.color2,
      required this.color1,
      required this.text});

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color2;
  final Color color1;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color2,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1, color: color1)),
        child: Center(
          child: ReUsableText(
              text: text, style: appstyle(18, color1, FontWeight.bold)),
        ),
      ),
    );
  }
}
