import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_color.dart';
import '../widget/app_bar.dart';

class FindRestaurantPage extends StatelessWidget {
  const FindRestaurantPage({super.key});
  static const route = '/findRestaurant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBars(title: '대중 교통 기준', color: AppColor.black),
      ),
    );
  }
}