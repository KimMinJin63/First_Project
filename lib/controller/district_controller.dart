import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/model/district.dart';
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
    final snapshot = await FirebaseFirestore.instance
        .collection(district) 
        .where('category', isEqualTo: category)
        // .orderBy('category')
        // .orderBy('name', descending: true)
        .get();
    return snapshot.docs.map((doc) => District.fromSnapshot(doc)).toList();
  }


  
    Future<List<District>> detailRestaurant(String distrct, String name) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(distrct) // Change 'restaurants' to your collection name
        .where('name', isEqualTo: name)
        .get();

    return snapshot.docs.map((doc) => District.fromSnapshot(doc)).toList();
  }


}
