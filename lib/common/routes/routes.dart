import 'package:flutter/material.dart';
import 'package:project1/features/auth/pages/login.dart';
import 'package:project1/features/auth/pages/otp_page.dart';
import 'package:project1/features/onborading/pages/onboarding.dart';
import 'package:project1/features/todo/pages/homepage.dart';

class Routes {
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String otp = 'otp';
  static const String home = 'home';

  static Route<dynamic> onGeneratorRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (context) => const OnBoarding());

      case login:
        return MaterialPageRoute(builder: (context) => const LogInPage());

      case otp:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) =>
                OtpPage(smsCodeId: args['smsCodeId'], phone: args['phone']));

      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());

      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
