import 'package:first_project/controller/review_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/review_detail_page.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPage extends GetView<ReviewController> {
  const ReviewPage({super.key});
  static const route = '/review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBars(title: '리뷰작성', color: AppColor.black),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.searchController,
                      onChanged: (value) {
                        controller.findName.value = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.darkgrey,
                        hintText: '장소, 지명을 검색해주세요.',
                        contentPadding: const EdgeInsets.all(20),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (controller.findName.value.isNotEmpty) {
                              controller.findRestaurant();
                            }
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 20,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: Obx(() {
              if (controller.findName.value.isEmpty) {
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
                          onPressed: () => Get.toNamed(ReviewDetailPage.route,
                              arguments: restaurant),
                          color: AppColor.black,
                          style: AppTextStyle.koPtRegular16white());
                    });
              }
            }))
          ],
        ),
      )),
    );
  }
}
