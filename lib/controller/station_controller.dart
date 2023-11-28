import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/model/district.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationController extends GetxController{
    TextEditingController searchController = TextEditingController();
    RxString findStation = ''.obs;
      RxList<District> searchResults = <District>[].obs;



findRestaurant() async {
    if (findStation.value.isNotEmpty) {
      List<QuerySnapshot> snapshots = [];

      for (var collectionName in [
        '동구',
        '서구',
        '남구',
        '북구',
        '중구',
        '달서구',
        '수성구',
        '달성군',
      ]) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection(collectionName)
            .where('station', isEqualTo: findStation.value)
            .get();
        snapshots.add(snapshot);
      }
      List<District> results = [];
      for (var snap in snapshots) {
        results.addAll(
          snap.docs.map((doc) => District.fromSnapshot(doc)),
        );
      }
      if (results.isEmpty) {
        print('일치하는 결과가 없습니다.');
        searchResults.clear();
      } else {
        print('일치하는 결과를 찾았습니다: $results');
        searchResults.assignAll(results);
      }
    } else {
      searchResults.clear();
    }
  }
}