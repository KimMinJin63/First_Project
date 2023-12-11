// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:first_project/model/district.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class StationController extends GetxController {
//   TextEditingController searchController = TextEditingController();
//   RxString findStation = ''.obs;
//   RxBool isSearching = false.obs;
//   // RxString switchName = ''.obs;
//   // RxList switchNameList = [].obs;
//   RxList<District> searchResults = <District>[].obs;

// findStations() async {
//   print('findStations 시작');
//   if (findStation.value.isNotEmpty) {
//     List<QuerySnapshot> snapshots = [];

//     for (var collectionName in [
//       '동구',
//       '서구',
//       '남구',
//       '북구',
//       '중구',
//       '달서구',
//       '수성구',
//       '달성군',
//     ]) {
//       print('컬렉션 조회 중: $collectionName');
//       QuerySnapshot snapshot = await FirebaseFirestore.instance
//           .collection(collectionName)
//           .where('subway', isGreaterThanOrEqualTo: findStation.value)
//           .where('subway', isLessThanOrEqualTo: '${findStation.value}\uf8ff')
//           .get();
//       snapshots.add(snapshot);
//     }
//     List<District> results = [];
//     for (var snap in snapshots) {
//       results.addAll(
//         snap.docs.map((doc) => District.fromSnapshot(doc)),
//       );
//       print('스냅샷 결과 : $snapshots');
//       print('리절트 결과 : $results');
//     }
//     if (results.isEmpty) {
//       print('일치하는 결과가 없습니다.');
//       searchResults.clear();
//     } else {
//       print('일치하는 결과를 찾았습니다: $results');
//       print('일치하는 수 : ${results.length}');
//       searchResults.assignAll(results);
//     }
//     print('findStations 종료');
//   } else {
//     searchResults.clear();
//     print('검색어가 비어 있습니다.');
//   }
// }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/model/district.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  TextEditingController searchController1 = TextEditingController();
  TextEditingController searchController2 = TextEditingController();
  PageController pageController = PageController();

  RxString findStation = ''.obs;
  RxString findBusStation = ''.obs;
  RxBool isSearching = false.obs;
  RxList<District> searchResults = <District>[].obs;
  RxList<District> searchBusResults = <District>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void updateSearchResults(List<District> results) {
    searchResults.assignAll(results);
    searchBusResults.assignAll(results);
    update(); // 다시 빌드를 트리거합니다.
  }

  findStations() async {
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
            .where('subway', isGreaterThanOrEqualTo: findStation.value)
            .where('subway', isLessThanOrEqualTo: '${findStation.value}\uf8ff')
            .get();
        snapshots.add(snapshot);
      }
      List<District> results = [];
      for (var snap in snapshots) {
        results.addAll(
          snap.docs.map((doc) => District.fromSnapshot(doc)),
        );
        print('스냅샷 결과 : $snapshots');
        print('리절트 결과 : $results');
      }
      if (results.isEmpty) {
        print('일치하는 결과가 없습니다.');
        searchResults.clear();
      } else {
        print('일치하는 결과를 찾았습니다: $results');
        print('일치하는 수 : ${results.length}');
        searchResults.assignAll(results);

        // for (var district in searchResults) {
        //   switchName.value = district.name!;
        //   print('이름 : ${switchName.value}');
        //   // return searchResults.contains(findStation.value);
        // }
      }
    } else {
      searchResults.clear();
    }
  }

  findBusStations() async {
    if (findBusStation.value.isNotEmpty) {
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
            .where('bus', isGreaterThanOrEqualTo: findBusStation.value)
            .where('bus', isLessThanOrEqualTo: '${findBusStation.value}\uf8ff')
            .get();
        snapshots.add(snapshot);
      }
      List<District> results1 = [];
      for (var snap in snapshots) {
        results1.addAll(
          snap.docs.map((doc) => District.fromSnapshot(doc)),
        );
        print('스냅샷 결과111 : $snapshots');
        print('리절트 결과111 : $results1');
      }
      if (results1.isEmpty) {
        print('일치하는 결과가 없습니다.');
        searchBusResults.clear();
      } else {
        print('일치하는 결과를 찾았습니다: $results1');
        print('일치하는 수 : ${results1.length}');
        searchBusResults.assignAll(results1);

        // for (var district in searchResults) {
        //   switchName.value = district.name!;
        //   print('이름 : ${switchName.value}');
        //   // return searchResults.contains(findStation.value);
        // }
      }
    } else {
      searchBusResults.clear();
    }
  }
}
