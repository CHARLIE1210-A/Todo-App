import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/reusable_text.dart';
import 'package:project1/features/auth/controller/code_provider.dart';

class Testpage extends ConsumerWidget {
  const Testpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ReUsableText(
                text: code,
                style: appstyle(30, AppConst.kBkLight, FontWeight.bold)),
            TextButton(
                onPressed: () {
                  ref.read(codeStateProvider.notifier).setStart("Hello ande");
                },
                child: Text("Press Me")),
          ],
        ),
      ),
    );
  }
}
