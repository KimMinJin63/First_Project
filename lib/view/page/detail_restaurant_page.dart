import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:first_project/view/widget/app_detail_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailRestaurantPage extends GetView<DistrictController> {
  const DetailRestaurantPage({super.key});
  static const route = '/detailRestaurant';

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final selectedDistrict = args['district'];
    final name = args['name'];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBars(title: '', color: AppColor.black, home: () {Get.back(); Get.back(); Get.back();}),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyle.koPtBold32()),
              const SizedBox(
                height: 8,
              ),
              FutureBuilder<List<District>>(
                  future: controller.detailRestaurant(selectedDistrict, name),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          '식당 데이터가 없습니다.\n빠른 시일 내에 업데이트 하겠습니다.',
                          style: AppTextStyle.koPtBold32(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      List<District> restaurants = snapshot.data!;
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(color: AppColor.black),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: restaurants.map((restaurant) {
                              String htmlAddress = restaurant.address!;
                              htmlAddress =
                                  htmlAddress.replaceAll('<br />', '\n');
                              String htmlMenu = restaurant.menu!;
                              htmlMenu = htmlMenu.replaceAll('<br />', '\n');
                              String htmlSubway = restaurant.subway!;
                              htmlSubway =
                                  htmlSubway.replaceAll('<br />', '\n');
                              String htmlBus = restaurant.bus!;
                              htmlBus = htmlBus.replaceAll('<br />', '\n');
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppDetailRestaurant(
                                      detail: '$htmlAddress\n',
                                      detailName: '식당 주소 : '),
                        
                                  // Text(
                                  //   '식당 주소 : ${restaurant.address}\n',
                                  //   style: AppTextStyle.koPtRegular16white(),
                                  // ),
                                  Text(
                                    '연락처 : ${restaurant.telNum}\n',
                                    style: AppTextStyle.koPtRegular16white(),
                                  ),
                                  AppDetailRestaurant(
                                      detail: '$htmlMenu\n', detailName: '메뉴 : '),
                                  Text('예약가능 여부 : ${restaurant.booking}\n',
                                      style: AppTextStyle.koPtRegular16white()),
                                  Text('주차장 여부 : ${restaurant.parking}\n',
                                      style: AppTextStyle.koPtRegular16white()),
                                  // Text(
                                  //   '지하철 오시는 길 : ${restaurant.subway}\n',
                                  //   style: AppTextStyle.koPtRegular16white(),
                                  // ),
                                  // Text(
                                  //   '버스 오시는 길 : ${restaurant.bus}\n',
                                  //   style: AppTextStyle.koPtRegular16white(),
                                  // ),
                        
                                  AppDetailRestaurant(
                                      detail: '$htmlSubway\n',
                                      detailName: '지하철 오시는 길 : '),
                                  AppDetailRestaurant(
                                      detail: '$htmlBus\n',
                                      detailName: '버스 오시는 길 : '),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }
                  }),
              const SizedBox(
                height: 32,
              ),
              Text('리뷰', style: AppTextStyle.koPtBold32()),
            ],
          ),
        ),
      )),
    );
  }
}
