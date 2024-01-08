import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/common/widgets/reusable_text.dart';
import 'package:project1/features/auth/controller/auth_controller.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({super.key, required this.smsCodeId, required this.phone});

  final String smsCodeId;
  final String phone;

  void verifyOtp(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authcontrollerProvider).verifyOtpCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightSpacer(height: AppConst.kHieght * 0.15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                "assets/images/todo.jpg",
                width: AppConst.kWidth * 0.5,
              ),
            ),
            const HeightSpacer(height: 26),
            ReUsableText(
                text: "Enter your OTP",
                style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
            const HeightSpacer(height: 26),
            Pinput(
              length: 6,
              showCursor: true,
              onCompleted: (value) {
                if (value.length == 6) {
                  return verifyOtp(context, ref, value);
                }
              },
              onSubmitted: (value) {
                if (value.length == 6) {
                  return verifyOtp(context, ref, value);
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
