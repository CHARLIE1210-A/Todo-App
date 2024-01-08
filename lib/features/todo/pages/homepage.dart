import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/custom_text.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/common/widgets/reusable_text.dart';
import 'package:project1/common/widgets/width_spacer.dart';
import 'package:project1/features/todo/controller/todo_provider.dart';
import 'package:project1/features/todo/pages/add.dart';
import 'package:project1/features/todo/widgets/complete_task.dart';
import 'package:project1/features/todo/widgets/dayaftertomorrow.dart';
import 'package:project1/features/todo/widgets/today_task.dart';
import 'package:project1/features/todo/widgets/tomorrow_task.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReUsableText(
                        text: "Dashboard",
                        style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppConst.kBkDark,
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddTask()));
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppConst.kLight,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const HeightSpacer(height: 20),
              CustomTextField(
                keyboardType: TextInputType.name,
                hintText: "Search...",
                controller: search,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: null,
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConst.kBkDark,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesome.sliders,
                  color: AppConst.kBkLight,
                ),
              ),
              const HeightSpacer(height: 15),
            ],
          ),
        ),
      ),
      backgroundColor: AppConst.kLight,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(height: 25),
            Row(
              children: [
                const Icon(
                  FontAwesome.tasks,
                  size: 20,
                  color: AppConst.kBkDark,
                ),
                const WidthSpacer(wdith: 10),
                ReUsableText(
                    text: "Today's Task",
                    style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
              ],
            ),
            const HeightSpacer(height: 25),
            Container(
              decoration: BoxDecoration(
                color: AppConst.kBkDark,
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConst.kRadius)),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    color: AppConst.kBlueLight,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius))),
                controller: tabController,
                labelPadding: EdgeInsets.zero,
                isScrollable: false,
                labelColor: AppConst.kBlueLight,
                labelStyle: appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                unselectedLabelColor: AppConst.kBkDark,
                tabs: [
                  Tab(
                    child: SizedBox(
                      width: AppConst.kWidth * 0.5,
                      child: Center(
                        child: ReUsableText(
                            text: "Pending",
                            style:
                                appstyle(16, AppConst.kLight, FontWeight.bold)),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 30.w),
                      width: AppConst.kWidth * 0.5,
                      child: Center(
                        child: ReUsableText(
                            text: "Completed",
                            style:
                                appstyle(16, AppConst.kLight, FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const HeightSpacer(height: 20),
            SizedBox(
              height: AppConst.kHieght * 0.3,
              width: AppConst.kWidth,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConst.kRadius)),
                child: TabBarView(controller: tabController, children: [
                  Container(
                    color: AppConst.kBkLight,
                    height: AppConst.kHieght * 0.3,
                    child: const TodayTask(),
                  ),
                  Container(
                    color: AppConst.kBkLight,
                    height: AppConst.kHieght * 0.3,
                    child: const CompleteTask(),
                  )
                ]),
              ),
            ),
            const HeightSpacer(height: 20),
            const TomorrowTask(),
            const HeightSpacer(height: 20),
            const DayAfterTask(),
            const HeightSpacer(height: 20),
          ],
        ),
      )),
    );
  }
}
