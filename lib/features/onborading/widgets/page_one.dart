import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHieght,
      width: AppConst.kWidth,
      color: AppConst.kLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/images/todo.jpg"),
          ),
          const HeightSpacer(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReUsableText(
                  text: "Todo with Me",
                  style: appstyle(30, AppConst.kBkDark, FontWeight.w500)),
              const HeightSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Welcome, Do you want to create a task with fast and ease.",
                  textAlign: TextAlign.center,
                  style: appstyle(16, AppConst.kBkDark, FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
