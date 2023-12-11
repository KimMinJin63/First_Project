import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/controller/station_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/review_detail_page.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPageview extends StatelessWidget {
  const AppPageview({super.key, this.onChanged, required this.controller, this.onPressed, required this.itemCount, this.itemBuilder});
  final Function()? onChanged;
  final Function()? onPressed;
  final Function()? itemBuilder;
  final TextEditingController controller;
  final int itemCount;


  @override
  Widget build(BuildContext context) {
    var controllers = Get.find<StationController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  onChanged: (value) { onChanged;},
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        onPressed;
                        // print('----------작동1');
                        // print('검색어: ${controller.findStation.value}');
                        // controller.findStations();
                        // if (controller.findStation.value.isNotEmpty) {
                        //   print('=============작동2');
                        //   await controller.findStations();
                        // }
                        // print('=============작동3');
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: '장소, 지명을 검색해주세요.',
                    contentPadding: const EdgeInsets.all(20),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Obx(() {
            if (controllers.findStation.value.isNotEmpty &&
                controllers.searchResults.isEmpty &&
                !controllers.isSearching.value) {
              return const SizedBox();
              // return Text(
              //   '일치하는 식당이 없습니다.',
              //   style: TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.center,
              // );
            } else {
              return ListView.builder(
                itemCount:itemCount,
                itemBuilder: (context, index) {
                  itemBuilder;
                  // final restaurant = controller.searchResults[index];
                  // return AppButton(
                  //   name: restaurant.name ?? '식당 없음',
                  //   onPressed: () {
                  //     Get.toNamed(
                  //       ReviewDetailPage.route,
                  //       arguments: restaurant,
                  //     );
                  //   },
                  //   color: AppColor.black,
                  //   style: AppTextStyle.koPtRegular16white(),
                  // );
                },
              );
            }
          }),
        ),
      ],
    );
  }
}
