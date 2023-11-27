import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:flutter/material.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({super.key});
  static const route = '/myReview';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
              appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: AppBars(title: '', color: AppColor.black),
        ),

      body: SafeArea(
        child: Center(
          child: Text('my review page'),
        ) ),
    );
  }
}