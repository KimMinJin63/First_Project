import 'package:first_project/util/app_routes.dart';
import 'package:first_project/view/page/find_password_page.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/page/signup_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.findPassword,
        page: () => const FindPasswordPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.signup,
        page: () => const SignupPage(),
        transition: Transition.fadeIn)
  ];
}
