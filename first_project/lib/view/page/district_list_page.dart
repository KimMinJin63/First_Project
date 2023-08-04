import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:first_project/view/screen/main_screen.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:first_project/view/widget/app_district.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DistrictList extends GetView<DistrictController> {
  const DistrictList({super.key});
  static const route = '/districtList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child:
                  Text('어떤 구의 맛집을 찾고계신가요?', style: AppTextStyle.koPtBold27()),
            )),
            AppDistrict('동구', '동구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=동구',
                (selectedDistrict) {
              Get.toNamed(MainScreen.route, arguments: selectedDistrict);
            }),
            AppDistrict('서구', '서구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=서구',
                (selectedDistrict) {
              Get.toNamed(MainScreen.route, arguments: selectedDistrict);
            }),
            AppDistrict('남구', '남구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=남구',
                (selectedDistrict) {
              Get.toNamed(MainScreen.route, arguments: selectedDistrict);
            }),
            AppDistrict('북구', '북구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=북구',
                (selectedDistrict) {
              Get.toNamed(MainScreen.route, arguments: selectedDistrict);
            }),
            AppDistrict('수성구', '수성구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=수성구',
                (selectedDistrict) {
              Get.toNamed(MainScreen.route, arguments: selectedDistrict);
            }),
            AppDistrict('중구', '중구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=중구',
                (selectedDistrict) {
              Get.toNamed(MainScreen.route, arguments: selectedDistrict);
            }),
            AppDistrict('달서구', '달서구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=달서구',
                (selectedDistrict) {
              Get.toNamed(MainScreen.route, arguments: selectedDistrict);
            }),
            AppDistrict('달성군', '달성군',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=달성군',
                (selectedDistrict) {
              Get.toNamed(MainScreen.route, arguments: selectedDistrict);
            }),
          ],
        )),
      ),
    );
  }
}
