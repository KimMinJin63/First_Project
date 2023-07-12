import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/service/db_serviec.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistrictController extends GetxController {
  Future<List<District>> readData() async {
    Dio dio = Dio();
    List district = ['중구, 남구, 북구, 동구, 서구, 달서구, 달성군, 수성구'];
    var url = 'https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=';
    try {
      var res = await dio.get(url + district.toString());
      if (res.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(res.data);
        return data.map((item) => District.fromMap(item)).toList();
      }
    } catch (error) {
      // 에러 처리
    }
    
    return [];
  }

   @override
  void onInit() {
    super.onInit();
    DBService().northRestaurant();
    DBService().westRestaurant();
  }
 
}