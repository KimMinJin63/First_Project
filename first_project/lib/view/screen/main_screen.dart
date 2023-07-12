import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/category_restaurant_list_page.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<DistrictController> {
  const MainScreen({super.key});
  static const route = '/mainScreen';

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      '한식',
      '중식',
      '일식',
      '양식',
      '디저트/\n베이커리',
      '특별한\n술집',
      '세계요리',
      '퓨전\n뷔페',
      '전통차/\n커피 전문점'
    ];
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: AppBars(title: '', color: AppColor.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/images/logo.jpeg',
                height: MediaQuery.of(context).size.height / 5,
              )),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25),
                    itemBuilder: (context, index) {
                      String category = categories[index];
                      return GestureDetector(
                        onTap: () =>
                            Get.offNamed(CategoryRestaurantListPage.route),
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                category,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.koPtSemiBold20white()
                              ),
                            )),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
