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

class ReviewDetailPage extends GetView<ReviewController> {
  const ReviewDetailPage({super.key});
  static const route = '/reviewDetail';

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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBars(title: '리뷰작성', color: AppColor.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.bottomLeft,
                          decoration:
                              const BoxDecoration(color: AppColor.black),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: restaurants.map((restaurant) {
                                String htmlMenu = restaurant.menu!;
                                htmlMenu = htmlMenu.replaceAll('<br />', '\n');
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppDetailRestaurant(
                                        detail: '$htmlMenu\n',
                                        detailName: '메뉴 : '),
                                    Text(
                                      '영업시간 : ${restaurant.time}\n',
                                      style: AppTextStyle.koPtRegular16white(),
                                    ),
                                    Text(
                                      '연락처 : ${restaurant.telNum}\n',
                                      style: AppTextStyle.koPtRegular16white(),
                                    ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('리뷰', style: AppTextStyle.koPtBold32()),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Column(
                      children: [
                        FutureBuilder<List<Message>>(
                            future: controller.streamMessages(
                                collections, restaurant.cnt),
                            builder: (context, asyncSnapshot) {
                              if (asyncSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator(); // 연결 중이면 로딩 표시
                              } else if (!asyncSnapshot.hasData) {
                                return const Text('데이터가 없습니다.'); // 데이터 없음
                              } else if (asyncSnapshot.hasError) {
                                return const Text('Error adding message: $e');
                              } else {
                                List<Message> messages = asyncSnapshot.data!;
                                print('Received messages: $messages');
                                return Expanded(
                                  child: ListView.builder(
                                    primary: false,
                                    reverse: true,
                                    physics: const BouncingScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: messages.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 25),
                                        child: ReviewCard(
                                            message: messages[index]),
                                      );
                                    },
                                  ),
                                );
                              }
                            })
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.textEditingController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '리뷰를 작성해주세요',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.onPressedButton(
                                        collections, restaurant.cnt);
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    size: 20,
                                    color: AppColor.black,
                                  )),
                              filled: true,
                              fillColor: AppColor.darkgrey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
