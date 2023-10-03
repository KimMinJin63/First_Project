import 'package:first_project/controller/main_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/page/bar_list_page.dart';
import 'package:first_project/view/page/chinese_list_page.dart';
import 'package:first_project/view/page/coffee_list_page.dart';
import 'package:first_project/view/page/dessert_list_page.dart';
import 'package:first_project/view/page/fusion_list_page.dart';
import 'package:first_project/view/page/japanese_list_page.dart';
import 'package:first_project/view/page/korean_list_page.dart';
import 'package:first_project/view/page/western_list_page.dart';
import 'package:first_project/view/page/world_list_page.dart';
import 'package:first_project/view/screen/like_screen.dart';
import 'package:first_project/view/screen/my_screen.dart';
import 'package:first_project/view/screen/search_screen.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:first_project/view/widget/app_bottom_navigation.dart';
import 'package:first_project/view/widget/app_category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CategoryRestaurantPage extends GetView<MainController> {
  const CategoryRestaurantPage({super.key});
  static const route = '/category';

  @override
  Widget build(BuildContext context) {
    final selectedDistrict = Get.arguments;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBars(title: '$selectedDistrict', color: AppColor.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.asset(
                'assets/images/logo.jpeg',
                height: MediaQuery.of(context).size.height / 5,
              ),
            )),
            const SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppCategoryButton(
                        category: '한식',
                        onPressed: () => Get.toNamed(KoreanListPage.route,
                            arguments: '$selectedDistrict')),
                    AppCategoryButton(
                        category: '중식',
                        onPressed: () => Get.toNamed(ChineseListPage.route,
                            arguments: '$selectedDistrict')),
                    AppCategoryButton(
                        category: '일식',
                        onPressed: () => Get.toNamed(JapaneseListPage.route,
                            arguments: '$selectedDistrict')),
                  ],
                ),
                Row(
                  children: [
                    AppCategoryButton(
                        category: '양식',
                        onPressed: () => Get.toNamed(WesternListPage.route,
                            arguments: '$selectedDistrict')),
                    AppCategoryButton(
                        category: '세계요리',
                        onPressed: () => Get.toNamed(WorldListPage.route,
                            arguments: '$selectedDistrict')),
                    AppCategoryButton(
                        category: '퓨전\n뷔페',
                        onPressed: () => Get.toNamed(FusionListPage.route,
                            arguments: '$selectedDistrict')),
                  ],
                ),
                Row(
                  children: [
                    AppCategoryButton(
                        category: '디저트/\n베이커리',
                        onPressed: () => Get.toNamed(DessertListPage.route,
                            arguments: '$selectedDistrict')),
                    AppCategoryButton(
                        category: '전통차/\n커피',
                        onPressed: () => Get.toNamed(CoffeeListPage.route,
                            arguments: '$selectedDistrict')),
                    AppCategoryButton(
                        category: '특별한\n술집',
                        onPressed: () => Get.toNamed(BarListPage.route,
                            arguments: '$selectedDistrict')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Obx(
      //   () => AppBottomNavigate(
      //     selectIndex: controller.selectedIndex.value,
      //     ontap: (index) {
      //       controller.navigationOnTap(index); // selectedIndex 업데이트
      //       if (index == 0) {
      //         Get.toNamed(CategoryRestaurantPage.route,
      //             arguments: selectedDistrict);
      //       } else if (index == 1) {
      //         Get.toNamed(SearchScreen.route);
      //       } else if (index == 2) {
      //         Get.toNamed(LikeScreen.route, arguments: selectedDistrict);
      //       } else if (index == 3) {
      //         Get.toNamed(MyScreen.route);
      //       }

      //       // 나머지 페이지도 동일하게 처리
      //     },
      //   ),
      // ),
    );
  }
}
