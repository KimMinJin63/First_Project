import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/detail_restaurant_page.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WesternListPage extends GetView<DistrictController> {
  const WesternListPage({super.key});
  static const route = '/western';

  @override
  Widget build(BuildContext context) {
    final selectedDistrict = Get.arguments as String;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: AppBars(title: '양식', color: AppColor.black, home: () => Get.offAllNamed(MainPage.route)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Image.asset(
                                  'assets/images/logo.jpeg',
                                  height: MediaQuery.of(context).size.height / 5,
                                ),
                  )),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                child: FutureBuilder<List<District>>(
                  future: controller.findRestaurant(selectedDistrict, '양식'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    // else if (snapshot.hasError) {
                    //   return Text(
                    //       'Error fetching categories: ${snapshot.error}');
                    // }
                    else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'SORRY\n식당이 없습니다ㅠㅠ',
                          style: AppTextStyle.koPtBold32(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      List<District> restaurants = snapshot.data!;
                      int pages = (restaurants.length / 5).ceil();
                      return PageView.builder(
                        itemCount: pages,
                        itemBuilder: (context, pageIndex){
                          int startIndex = pageIndex * 5;
                          int endIndex = (pageIndex + 1) * 5;
                          if (endIndex>restaurants.length) {
                            endIndex = restaurants.length;
                          }
                        List<District> pageItems = restaurants.sublist(startIndex, endIndex);
                        return ListView.builder(
                          itemCount: pageItems.length,
                          itemBuilder: (context, index) {
                            String name = pageItems[index].name!; // Use the 'name' property of the District object
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: GestureDetector(
                                onTap: () => Get.toNamed(
                                  DetailRestaurantPage.route,
                                      arguments: {
                                        'district': selectedDistrict,
                                        'name': name,
                                      },
                                ),
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: AppColor.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      name,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.koPtSemiBold20white(),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );}
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
