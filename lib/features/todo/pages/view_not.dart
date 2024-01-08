import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/common/widgets/reusable_text.dart';
import 'package:project1/common/widgets/width_spacer.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key, this.payload});
  final String? payload;

  @override
  Widget build(BuildContext context) {
    var title = payload!.split('|')[0];
    var desc = payload!.split('|')[1];
    // var date = payload!.split('|')[2];
    var start = payload!.split('|')[3];
    var finish = payload!.split('|')[4];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Container(
              width: AppConst.kWidth,
              height: AppConst.kHieght * 0.7,
              decoration: BoxDecoration(
                color: AppConst.kBkLight,
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConst.kRadius)),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReUsableText(
                        text: "Reminder",
                        style: appstyle(40, AppConst.kLight, FontWeight.bold)),
                    const HeightSpacer(height: 5),
                    Container(
                      width: AppConst.kWidth,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: AppConst.kYellow,
                        borderRadius: BorderRadius.all(Radius.circular(9.h)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReUsableText(
                              text: "Today",
                              style: appstyle(
                                  14, AppConst.kBkDark, FontWeight.bold)),
                          const WidthSpacer(wdith: 15),
                          ReUsableText(
                              text: "From : $start To : $finish",
                              style: appstyle(
                                  15, AppConst.kBkDark, FontWeight.w600)),
                        ],
                      ),
                    ),
                    const HeightSpacer(height: 10),
                    ReUsableText(
                        text: title,
                        style: appstyle(30, AppConst.kBkDark, FontWeight.bold)),
                    const HeightSpacer(height: 10),
                    Text(desc,
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                        style:
                            appstyle(16, AppConst.kLight, FontWeight.normal)),
                  ],
                ),
              ),
            ),
          ),
          // bellimage
          Positioned(
              right: 12,
              top: -10,
              child: Image.asset(
                'assets/images/todo.jpg',
                width: 70.w,
                height: 70.h,
              )),

          // notification image
          Positioned(
              bottom: -AppConst.kHieght * 0.142,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/todo.jpg',
                width: AppConst.kWidth * 0.8,
                height: AppConst.kHieght * 0.6,
              )),
        ],
      )),
    );
  }
}
