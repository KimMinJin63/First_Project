import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailRestaurantPage extends GetView<DistrictController> {
  const DetailRestaurantPage({super.key});
  static const route = '/detailRestaurant';

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      
      
    );
    // FutureBuilder<List<District>>(
    //      future: RestaurantData.fetchRestaurants(area),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     } else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     } else if (snapshot.hasData) {
    //       final restaurants = snapshot.data!;
    //       return ListView.builder(
    //         itemCount: restaurants.length,
    //         itemBuilder: (context, index) {
    //           final restaurant = restaurants[index];
    //           return ListTile(
    //             title: Text(District.name),
    //             subtitle: Text(District.address),
    //             trailing: Text(District.category),
    //             onTap: () {
    //               // 레스토랑 상세 정보 화면으로 이동하는 동작 구현
    //             },
    //           );
    //         },
    //       );
    // }}  );
  }
}