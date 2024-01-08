import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/features/todo/pages/update_task.dart';
import 'package:project1/features/todo/widgets/todo.dart';

import '../../../common/models/task_model.dart';
import '../controller/todo_provider.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listDate = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listDate
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();

    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (context, index) {
          final data = todayList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStatus(data);
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return TodoTile(
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: () {
                titles = data.title.toString();
                descs = data.desc.toString();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateTask(id: data.id ?? 0)));
              },
              child: const Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            title: data.title,
            color: color,
            descriptiom: data.desc,
            start: data.startTime,
            end: data.endTime,
            switcher: Switch(
                value: isCompleted,
                onChanged: (value) {
                  ref.read(todoStateProvider.notifier).markAsCompleted(
                      data.id ?? 0,
                      data.title.toString(),
                      data.desc.toString(),
                      1,
                      data.date.toString(),
                      data.startTime.toString(),
                      data.endTime.toString());
                }),
          );
        });
  }
}
