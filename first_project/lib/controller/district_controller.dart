import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/model/district.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistrictController extends GetxController {

  var pageController = PageController();
  // Future<List<District>> readData() async {
  //   Dio dio = Dio();
  //   List district = ['중구, 남구, 북구, 동구, 서구, 달서구, 달성군, 수성구'];
  //   var url = 'https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=';
  //   try {
  //     var res = await dio.get(url + district.toString());
  //     if (res.statusCode == 200) {
  //       var data = List<Map<String, dynamic>>.from(res.data);
  //       return data.map((item) => District.fromMap(item)).toList();
  //     }
  //   } catch (error) {
  //     // 에러 처리
  //   }

  //   return [];
  // }

  Future<List<String>> fetchCategories() async {
    List<String> categories = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('categories').get();
      if (querySnapshot.size > 0) {
        categories = querySnapshot.docs
            .map((doc) => doc.get('category') as String)
            .toList();
      }
    } catch (error) {
      // 에러 처리
      print("Error fetching categories: $error");
    }
    return categories;
  }

  Future<List<District>> findRestaurant(String distrct, String category) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(distrct) // Change 'restaurants' to your collection name
        .where('category', isEqualTo: category)
        .get();

    return snapshot.docs.map((doc) => District.fromSnapshot(doc)).toList();
  }

  // void district() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     String uid = user.uid;
  //     District district = District(
  //       cnt: 'cnt',
  //       address: 'address',
  //       category: 'category',
  //       name: 'name',
  //       telNum: 'telNum',
  //       time: 'time',
  //       menu: 'menu',
  //       booking: 'booking',
  //       parking: 'parking',
  //       subway: 'subway',
  //       bus: 'bus',
  //     );

  //     DocumentReference userDocRef =
  //         FirebaseFirestore.instance.collection('north').doc(district.cnt);
  //     DocumentSnapshot userDocSnapshot = await userDocRef.get();
  //     if (userDocSnapshot.exists) {
  //       Map<String, dynamic>? data =
  //           userDocSnapshot.data() as Map<String, dynamic>?;
  //       if (data != null) {
  //         List<dynamic> northRestaurant = data['north'] ?? [];
  //         northRestaurant.add(district.toMap());
  //       } else {}
  //     } else {}
  //   }
  // }
}
