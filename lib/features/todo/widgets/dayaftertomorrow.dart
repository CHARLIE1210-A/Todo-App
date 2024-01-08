import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/xpansion_tile.dart';
import 'package:project1/features/todo/controller/todo_provider.dart';
import 'package:project1/features/todo/pages/update_task.dart';
import 'package:project1/features/todo/widgets/todo.dart';

import '../controller/xpansion_provider.dart';

class DayAfterTask extends ConsumerWidget {
  const DayAfterTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    var color = ref.read(todoStateProvider.notifier).getRandomColor();
    String dayAfter = ref.read(todoStateProvider.notifier).getDayAfter();
    var tomorrowTask =
        todos.where((element) => element.date!.contains(dayAfter));
    return XpansionTile(
        text: DateTime.now()
            .add(const Duration(days: 2))
            .toString()
            .substring(5, 10),
        text2: "Day after  tomorrow tasks",
        onExpansionChanged: (bool expanded) {
          ref.read(xpansionStateProvider.notifier).setStart(!expanded);
        },
        trailing: Padding(
          padding: EdgeInsets.only(bottom: 12.w),
          child: ref.watch(xpansionStateProvider)
              ? const Icon(
                  AntDesign.circledown,
                  color: AppConst.kBkDark,
                )
              : const Icon(
                  AntDesign.clockcircleo,
                  color: AppConst.kBlueLight,
                ),
        ),
        children: [
          for (final todo in tomorrowTask)
            TodoTile(
                title: todo.title,
                descriptiom: todo.desc,
                color: color,
                start: todo.startTime,
                end: todo.endTime,
                delete: () {
                  ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
                },
                editWidget: GestureDetector(
                  onTap: () {
                    titles = todo.title.toString();
                    descs = todo.desc.toString();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateTask(id: todo.id ?? 0)));
                  },
                  child: const Icon(MaterialCommunityIcons.circle_edit_outline),
                ),
                switcher: const SizedBox.shrink())
        ]);
  }
}
