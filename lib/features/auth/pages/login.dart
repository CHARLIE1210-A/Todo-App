import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project1/common/utils/constants.dart';
import 'package:project1/common/widgets/appstyle.dart';
import 'package:project1/common/widgets/custom_btn.dart';
import 'package:project1/common/widgets/custom_text.dart';
import 'package:project1/common/widgets/height_spacer.dart';
import 'package:project1/common/widgets/reusable_text.dart';
import 'package:project1/common/widgets/show_dialog.dart';
import 'package:project1/features/auth/controller/auth_controller.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});

  @override
  ConsumerState<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  final TextEditingController phone = TextEditingController();
  Country country = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "INDIA",
      example: "INDIA",
      displayName: "INDIA",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  sendCodeToUser() {
    if (phone.text.isEmpty) {
      return showAlertDialog(
          context: context, message: "Please enter your phone number");
    } else if (phone.text.length < 8) {
      return showAlertDialog(
          context: context,
          message: "Your phone number is too short to proseed");
    } else {
      ref.read(authcontrollerProvider).sendSms(
          context: context, phone: '+${country.phoneCode}${phone.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kLight,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: ListView(
          children: [
            const HeightSpacer(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset("assets/images/todo.jpg"),
            ),
            const HeightSpacer(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: ReUsableText(
                text: "Please Enter your mobile number",
                style: appstyle(17, AppConst.kBkDark, FontWeight.w500),
              ),
            ),
            const HeightSpacer(height: 20),
            Center(
              child: CustomTextField(
                controller: phone,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: AppConst.kHieght * 0.6,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppConst.kRadius),
                                  topRight: Radius.circular(AppConst.kRadius))),
                          onSelect: (code) {
                            setState(() {
                              country = code;
                            });
                          });
                    },
                    child: ReUsableText(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                  ),
                ),
                keyboardType: TextInputType.number,
                hintText: "Enter your number",
                hintstyle: appstyle(18, AppConst.kBkDark, FontWeight.w600),
              ),
            ),
            const HeightSpacer(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomBtn(
                  onTap: () {
                    sendCodeToUser();
                  },
                  width: AppConst.kWidth * 0.9,
                  height: AppConst.kHieght * 0.07,
                  color1: AppConst.kLight,
                  color2: AppConst.kBkDark,
                  text: "Send Code"),
            ),
          ],
        ),
      )),
    );
  }
}
