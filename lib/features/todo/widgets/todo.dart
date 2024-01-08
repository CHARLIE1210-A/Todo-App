import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/common/widgets/reusable_text.dart';
import 'package:project1/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.descriptiom,
      this.start,
      this.end,
      this.editWidget,
      this.delete,
      this.switcher});
  final Color? color;
  final String? title;
  final String? descriptiom;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? switcher;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: BoxDecoration(
              color: AppConst.kGreyDk,
              borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppConst.kRadius)),
                        color: color ?? AppConst.kRed,
                      ),
                    ),
                    const WidthSpacer(wdith: 12),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReUsableText(
                              text: title ?? "Title of todo",
                              style: appstyle(
                                  18, AppConst.kLight, FontWeight.bold),
                            ),
                            const HeightSpacer(height: 3),
                            ReUsableText(
                              text: descriptiom ?? "Description of todo",
                              style: appstyle(
                                  12, AppConst.kLight, FontWeight.bold),
                            ),
                            const HeightSpacer(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConst.kWidth * 0.2,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.3, color: AppConst.kGreyDk),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppConst.kRadius)),
                                    color: AppConst.kLight,
                                  ),
                                  child: Center(
                                    child: ReUsableText(
                                        text: "$start | $end",
                                        style: appstyle(10, AppConst.kBkDark,
                                            FontWeight.normal)),
                                  ),
                                ),
                                const WidthSpacer(wdith: 15),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const WidthSpacer(wdith: 15),
                                    GestureDetector(
                                      onTap: delete,
                                      child: const Icon(
                                        MaterialCommunityIcons.delete_circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
