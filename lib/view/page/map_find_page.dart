import 'package:first_project/controller/map_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/review_detail_page.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MapFindPage extends GetView<MapController> {
  const MapFindPage({super.key});
  static const route = '/mapFind';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.searchController,
                    autofocus: true,
                    onChanged: (value) {
                      controller.findRestaurants.value = value;
                      controller.findRestaurant();
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: AppColor.darkgrey,
                      hintText: '장소, 지명을 검색해주세요.',
                      contentPadding: EdgeInsets.all(20),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: Obx(() {
              if (controller.findRestaurants.value.isEmpty) {
                return const SizedBox();
              } else if (controller.searchResults.isEmpty) {
                return Text(
                  '일치하는 식당이 없습니다.',
                  style: AppTextStyle.koPtBold32(),
                  textAlign: TextAlign.center,
                );
              } else {
                return ListView.builder(
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      final restaurant = controller.searchResults[index];
                      return AppButton(
                          name: restaurant.name ?? '식당 없음',
                          onPressed: () async {
                            print('버튼 눌림');
                            Get.back();
                            controller.moveToRestaurantLocation(restaurant);
                            controller.searchController.clear();
                            controller.searchResults.clear();
                            controller.searchResults.clear();
                            print('컨트롤러 작동');
                          }, // name: restaurant.na,
                          // onPressed: () => Get.toNamed(ReviewDetailPage.route,
                          //     arguments: restaurant),
                          color: AppColor.black,
                          style: AppTextStyle.koPtRegular16white());
                    });
              }
            }))
          ],
        ),
      ),
    );
  }
}
