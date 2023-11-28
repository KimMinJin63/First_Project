import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AppDistrict extends GetView<DistrictController> {
  const AppDistrict(this.name, this.district, this.url, this.onPressed, {super.key});
  final String name;
  final String district;
  final String url;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      name: name,
      style: AppTextStyle.koPtSemiBold20white(),
      color: AppColor.black,
      onPressed: () async {
       if (onPressed != null) {
          onPressed(district);
        }
        var districteUrl =
            url;
        Dio dio = Dio();
        final response = await dio.get(districteUrl);

        if (response.statusCode == 200) {
          final data = response.data['data'];
          String uid = FirebaseAuth.instance.currentUser!.uid;

          for (var item in data) {
            final cnt = item['cnt'];
            await FirebaseFirestore.instance
                .collection(district)
                .doc(cnt.toString())
                .set({
              'cnt': item['cnt'],
              'address': item['GNG_CS'],
              'category': item['FD_CS'],
              'name': item['BZ_NM'],
              'telNum': item['TLNO'],
              'time': item['MBZ_HR'],
              'menu': item['MNU'],
              'booking': item['BKN_YN'],
              'parking': item['PKPL'],
              'subway': item['SBW'],
              'bus': item['BUS'],
            });
          }
          print(response.data);
        }
      },
    );
  }
}
