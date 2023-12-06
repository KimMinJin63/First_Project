import 'dart:math';
import 'package:first_project/controller/review_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/model/message.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:first_project/view/widget/app_detail_restaurant.dart';
import 'package:first_project/view/widget/app_review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarkerDetailPage extends GetView<ReviewController> {
  const MarkerDetailPage({super.key});
  static const route = '/markerDetail';

  @override
  Widget build(BuildContext context) {
    var collections = [
      '동구',
      '서구',
      '남구',
      '북구',
      '중구',
      '달서구',
      '수성구',
      '달성군',
    ];
    final restaurant = Get.arguments;
    // Stream<List<Message>> reviewStream =
    //     controller.streamMessages(collections, restaurant.cnt);
    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(30),
      //   child: AppBars(title: '리뷰작성', color: AppColor.black),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(restaurant.name, style: AppTextStyle.koPtBold32()),
              const SizedBox(
                height: 8,
              ),
              FutureBuilder<List<District>>(
                  future: controller.detailRestaurant(restaurant.name),
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
                      return const Center(
                        child: Text(
                          '데이터를 찾을 수 없습니다.',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    } else {
                      List<District> restaurants = snapshot.data!;
                      return SingleChildScrollView(
                        // scrollDirection: Axis.horizontal,
                        child: Container(
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
                                        detail: '$htmlMenu\n',
                                        detailName: '메뉴 : '),
                                    Text('예약가능 여부 : ${restaurant.booking}\n',
                                        style:
                                            AppTextStyle.koPtRegular16white()),
                                    Text('주차장 여부 : ${restaurant.parking}\n',
                                        style:
                                            AppTextStyle.koPtRegular16white()),
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
                        ),
                      );
                    }
                  }),
              const SizedBox(
                height: 32,
              ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: TextButton(
              //       onPressed: () {
              //         // Get.back();
              //         // Get.back();
              //       },
              //       child: Text('뒤로가기')),
              // )
            ],
          ),
        )),
      ),
      floatingActionButton: TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: Text('뒤로가기')),
    );
  }
}
