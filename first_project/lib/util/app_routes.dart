import 'package:first_project/view/page/category_restaurant_list_page.dart';
import 'package:first_project/view/page/find_password_page.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:first_project/view/page/signup_page.dart';
import 'package:first_project/view/screen/like_screen.dart';
import 'package:first_project/view/screen/main_screen.dart';
import 'package:first_project/view/screen/my_screen.dart';
import 'package:first_project/view/screen/search_screen.dart';

class AppRoutes {
  static const login = LoginPage.route;
  static const findPassword = FindPasswordPage.route;
  static const signup = SignupPage.route;
  static const mainScreen = MainScreen.route;
  static const category = CategoryRestaurantListPage.route;
  static const main = MainPage.route;
  static const searchScreen = SearchScreen.route;
  static const likeScreen = LikeScreen.route;
  static const myScreen = MyScreen.route;
}
