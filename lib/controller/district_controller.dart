import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/service/db_serviec.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistrictController extends GetxController {

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

 Future<List<District>> findRestaurant(String district, String category) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection(district) 
        .where('FD_CS', isEqualTo: category)
        // .orderBy('name', descending: false)
        .get();
        print('스냅샷 : ${snapshot.size}');
    return snapshot.docs.map((doc) => District.fromSnapshot(doc)).toList();
    
  } catch (e) {
    print(e);
  }
  return [];
  }


  
    Future<List<District>> detailRestaurant(String distrct, String name) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(distrct) // Change 'restaurants' to your collection name
        .where('BZ_NM', isEqualTo: name)
        // .orderBy('name', descending: true)
        .get();

    return snapshot.docs.map((doc) => District.fromSnapshot(doc)).toList();
  }
   @override
  void onInit() {
    super.onInit();
    // DBService().northRestaurant();
    // DBService().westRestaurant();
    // DBService().dalseoRestaurant();
  }

}
