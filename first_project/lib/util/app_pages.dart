import 'package:first_project/util/app_routes.dart';
import 'package:first_project/view/page/bar_list_page.dart';
import 'package:first_project/view/page/chinese_list_page.dart';
import 'package:first_project/view/page/coffee_list_page.dart';
import 'package:first_project/view/page/dessert_list_page.dart';
import 'package:first_project/view/page/detail_restaurant_page.dart';
import 'package:first_project/view/page/fusion_list_page.dart';
import 'package:first_project/view/page/japanese_list_page.dart';
import 'package:first_project/view/page/korean_list_page.dart';
import 'package:first_project/view/page/district_list_page.dart';
import 'package:first_project/view/page/find_password_page.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:first_project/view/page/signup_page.dart';
import 'package:first_project/view/page/western_list_page.dart';
import 'package:first_project/view/page/world_list_page.dart';
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
        name: AppRoutes.korean,
        page: () => KoreanListPage(),
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
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.districtList,
        page: () => const DistrictList(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.detailRestaurant,
        page: () => const DetailRestaurantPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.chinese,
        page: () => const ChineseListPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.japanese,
        page: () => const JapaneseListPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.western,
        page: () => const WesternListPage(),
        transition: Transition.fadeIn),
            GetPage(
        name: AppRoutes.dessert,
        page: () => const DessertListPage(),
        transition: Transition.fadeIn),
                    GetPage(
        name: AppRoutes.bar,
        page: () => const BarListPage(),
        transition: Transition.fadeIn),
                    GetPage(
        name: AppRoutes.world,
        page: () => const WorldListPage(),
        transition: Transition.fadeIn),
                    GetPage(
        name: AppRoutes.fusion,
        page: () => const FusionListPage(),
        transition: Transition.fadeIn),
                    GetPage(
        name: AppRoutes.coffee,
        page: () => const CoffeeListPage(),
        transition: Transition.fadeIn)





  ];
}
