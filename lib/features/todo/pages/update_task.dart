import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/custom_btn.dart';
import 'package:project1/common/widgets/custom_text.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/features/todo/controller/dates/date_provider.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:project1/features/todo/controller/todo_provider.dart';

class UpdateTask extends ConsumerStatefulWidget {
  const UpdateTask({super.key, required this.id});
  final int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {
  final TextEditingController title = TextEditingController(text: titles);
  final TextEditingController desc = TextEditingController(text: descs);

  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(finishTimeStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(height: 20),
            CustomTextField(
              keyboardType: TextInputType.text,
              hintText: "Add title",
              controller: title,
              hintstyle: appstyle(16, AppConst.kGreyDk, FontWeight.w600),
            ),
            const HeightSpacer(height: 20),
            CustomTextField(
              keyboardType: TextInputType.text,
              hintText: "Add description",
              controller: desc,
              hintstyle: appstyle(16, AppConst.kGreyDk, FontWeight.w600),
            ),
            const HeightSpacer(height: 20),
            CustomBtn(
                onTap: () {
                  picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2020, 3, 5),
                      maxTime: DateTime(2023, 12, 12),
                      theme: const picker.DatePickerTheme(
                        doneStyle:
                            TextStyle(color: AppConst.kGreen, fontSize: 16),
                      ),
                      onConfirm: (time) => ref
                          .read(dateStateProvider.notifier)
                          .setDate(time.toString()),
                      currentTime: DateTime.now(),
                      locale: picker.LocaleType.en);
                },
                width: AppConst.kWidth,
                height: 52.h,
                color1: AppConst.kLight,
                color2: AppConst.kGreenLight,
                text: scheduleDate == ""
                    ? "Set Date"
                    : scheduleDate.substring(0, 10)),
            const HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBtn(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (time) {
                          return ref
                              .read(startTimeStateProvider.notifier)
                              .setStart(time.toString());
                        },
                        locale: picker.LocaleType.en,
                      );
                    },
                    width: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color1: AppConst.kLight,
                    color2: AppConst.kGreenLight,
                    text: start == "" ? "Start Time" : start.substring(10, 16)),
                CustomBtn(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (time) {
                          return ref
                              .read(finishTimeStateProvider.notifier)
                              .setFinish(time.toString());
                        },
                        locale: picker.LocaleType.en,
                      );
                    },
                    width: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color1: AppConst.kLight,
                    color2: AppConst.kGreenLight,
                    text: finish == "" ? "End Time" : finish.substring(10, 16)),
              ],
            ),
            const HeightSpacer(height: 20),
            CustomBtn(
                onTap: () {
                  if (title.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      scheduleDate.isNotEmpty &&
                      start.isNotEmpty &&
                      finish.isNotEmpty) {
                    ref.read(todoStateProvider.notifier).updateItem(
                          widget.id,
                          title.text,
                          desc.text,
                          0,
                          scheduleDate,
                          start.substring(10, 16),
                          finish.substring(10, 16),
                        );
                    ref.read(dateStateProvider.notifier).setDate("");
                    ref.read(startTimeStateProvider.notifier).setStart("");
                    ref.read(finishTimeStateProvider.notifier).setFinish("");
                    Navigator.pop(context);
                  } else {
                    return;
                  }
                },
                width: AppConst.kWidth,
                height: 52.h,
                color1: AppConst.kLight,
                color2: AppConst.kBlueLight,
                text: "Submit"),
          ],
        ),
      ),
    );
  }
}
