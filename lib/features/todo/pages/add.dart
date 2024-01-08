import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/helpers/notificaion_helper.dart';
import 'package:project1/common/models/task_model.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/custom_btn.dart';
import 'package:project1/common/widgets/custom_text.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/common/widgets/show_dialog.dart';
import 'package:project1/features/todo/controller/dates/date_provider.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:project1/features/todo/controller/todo_provider.dart';
import 'package:project1/features/todo/pages/homepage.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  List<int> notification = [];
  late NotificationHelper notifierHelper;
  late NotificationHelper controller;
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    notifierHelper = NotificationHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0), () {
      controller = NotificationHelper(ref: ref);
    });
    notifierHelper.initilizeNotification();
    super.initState();
  }

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
                          ref
                              .read(startTimeStateProvider.notifier)
                              .setStart(time.toString());
                          notification = ref
                              .read(startTimeStateProvider.notifier)
                              .dates(time);
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
                    Task task = Task(
                        title: title.text,
                        desc: desc.text,
                        isCompleted: 0,
                        date: scheduleDate,
                        startTime: start.substring(10, 16),
                        endTime: finish.substring(10, 16),
                        remind: 0,
                        repeat: "yes");
                    notifierHelper.scheduleNotification(
                        notification[0],
                        notification[1],
                        notification[2],
                        notification[3],
                        task);
                    ref.read(todoStateProvider.notifier).addItem(task);
                    // ref.read(dateStateProvider.notifier).setDate("");
                    // ref.read(startTimeStateProvider.notifier).setStart("");
                    // ref.read(finishTimeStateProvider.notifier).setFinish("");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else {
                    showAlertDialog(
                        context: context, message: 'Failed to add task');
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
