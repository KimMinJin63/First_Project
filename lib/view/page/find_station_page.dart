import 'package:first_project/controller/station_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/review_detail_page.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_color.dart';
import '../widget/app_bar.dart';

class FindStationPage extends GetView<StationController> {
  const FindStationPage({super.key});
  static const route = '/findStation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBars(title: '대중 교통 기준', color: AppColor.black),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 8),
            //   child: TextField(
            //     controller: controller.searchController,
            //     onChanged: (value){
            //       controller.findStation.value = value;
            //     },
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: AppColor.darkgrey,
            //         hintText: '역, 정류장을 검색해주세요.',
            //         contentPadding: const EdgeInsets.all(20),
            //         border: InputBorder.none,
            //         suffixIconColor: Colors.black,
            //         suffixIcon: IconButton(
            //             onPressed: () {
            //               if (controller.findStation.value.isNotEmpty) {
            //                 controller.findStations();
            //               }
            //               // print('${controller.findStations}');
            //             },
            //             icon: const Icon(Icons.search))),

            //   ),

            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.searchController,
                      autofocus: true,
                      onChanged: (value) {
                        controller.findStation.value = value;
                        controller.findStations();
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
                    onPressed: () {
                      if (controller.findStation.value.isNotEmpty) {
                        controller.findStations();
                      }
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 20,
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: Obx(() {
              if (controller.findStation.value.isEmpty) {
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
                      return 
                  AppButton(
                      name: restaurant.name ?? '식당 없음', 
                      onPressed: () {
                        // // 선택된 District를 업데이트하고 페이지 이동
                        // controller.updateSelectedDistrict(restaurant);
                        Get.toNamed(ReviewDetailPage.route,
                            arguments: restaurant);
                      },
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
