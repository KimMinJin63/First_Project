import 'package:first_project/controller/main_controller.dart';
import 'package:first_project/view/screen/like_screen.dart';
import 'package:first_project/view/screen/main_screen.dart';
import 'package:first_project/view/screen/my_screen.dart';
import 'package:first_project/view/screen/search_screen.dart';
import 'package:first_project/view/widget/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          extendBodyBehindAppBar: true,
          body: PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              MainScreen(),
              SearchScreen(),
              LikeScreen(),
              MyScreen()
            ],
          ),
          bottomNavigationBar: Obx(
            () => AppBottomNavigate(
              selectIndex: controller.selectedIndex.value,
              ontap: (index) => controller.navigationOnTap(index),
              ),
          ),
        );
  }
}
