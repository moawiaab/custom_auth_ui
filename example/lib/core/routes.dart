import 'package:custom_auth_ui/custom_auth_ui.dart';
import 'package:get/get.dart';
import 'package:example/views/pages/settings.dart';
import 'package:example/views/screen/home_screen.dart';

class RouteHelper {
  static const String mainPage = "/";
  static const String loginPage = "/login";
  static const String registerPage = "/register";
  static const String forgetPassword = "/forget_password";
  static const String onboardingPage = "/onboarding";
  static const String settingsPage = "/settings";

  List<GetPage> routes = [
    GetPage(name: mainPage, page: () => const HomeScreen()),
    GetPage(
        name: loginPage,
        page: () => const LoginPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(name: registerPage, page: () => const RegisterPage()),
    GetPage(name: forgetPassword, page: () => const ForgetPasswordPage()),
    GetPage(
        name: onboardingPage,
        page: () => Onboarding(
              onboardingPage: onboardingList,
            ),
        middlewares: [OnboardingMiddleware()]),
    GetPage(name: settingsPage, page: () => const SettingPage())
  ];
}
