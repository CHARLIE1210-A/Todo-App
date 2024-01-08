import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/custom_btn.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/features/auth/pages/login.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
          CustomBtn(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LogInPage()));
              },
              width: AppConst.kWidth * 0.9,
              height: AppConst.kHieght * 0.06,
              color1: AppConst.kBkDark,
              text: "LogIn with a Phone number"),
        ],
      ),
    );
  }
}
