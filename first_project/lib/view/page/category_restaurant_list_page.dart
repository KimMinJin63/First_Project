import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CategoryRestaurantListPage extends GetView<DistrictController> {
  const CategoryRestaurantListPage({super.key});
  static const route = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: AppBars(
          title: '',
          // District(category: ), 
          color: AppColor.white), 
        ),
      body: FutureBuilder(
        future: controller.readData(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    color: AppColor.black
                  ),
                  child: Text(snapshot.data![index] as String),
                );
              });
              
          }
          return const SizedBox();
        })
    );
  }
}