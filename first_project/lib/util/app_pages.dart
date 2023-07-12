import 'package:first_project/util/app_routes.dart';
import 'package:first_project/view/page/category_restaurant_list_page.dart';
import 'package:first_project/view/page/find_password_page.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:first_project/view/page/signup_page.dart';
import 'package:first_project/view/screen/like_screen.dart';
import 'package:first_project/view/screen/main_screen.dart';
import 'package:first_project/view/screen/my_screen.dart';
import 'package:first_project/view/screen/search_screen.dart';
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
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.mainScreen,
        page: () => const MainScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.category,
        page: () => const CategoryRestaurantListPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.main,
        page: () => const MainPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.searchScreen,
        page: () => const SearchScreen(),
        transition: Transition.fadeIn),
            GetPage(
        name: AppRoutes.likeScreen,
        page: () => const LikeScreen(),
        transition: Transition.fadeIn),
            GetPage(
        name: AppRoutes.myScreen,
        page: () => const MyScreen(),
        transition: Transition.fadeIn)


  ];
}
