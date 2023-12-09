import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/model/district.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxString findStation = ''.obs;
  RxBool isSearching = false.obs;
  // RxString switchName = ''.obs;
  // RxList switchNameList = [].obs;
  RxList<District> searchResults = <District>[].obs;

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
            .where('subway', arrayContains: findStation.value)
            // .where('subway', isGreaterThan: findStation.value)
            // .where('subway', isLessThan: '' + findStation.value + '역')
            // .where('subway', arrayContains: findStation.value)
            // .where('subway', isEqualTo: findStation.value)
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
//   findStations() async {
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
//       QuerySnapshot snapshot = await FirebaseFirestore.instance
//           .collection(collectionName)
//           .where('subway', isLessThan: '' + findStation.value + '역')
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
//       searchResults.assignAll(results);

//       for (var district in searchResults) {
//         switchName.value = district.name!;
//         print('이름 : ${switchName.value}');
//       }

//       // 여기서 일치 여부를 확인하고 메소드가 종료됩니다.
//       return searchResults.contains(findStation.value);
//     }
//   } else {
//     searchResults.clear();
//     // 일치 여부를 반환하는 코드가 필요한 경우 기본값을 반환하거나
//     // 다른 적절한 조치를 취해야 할 것입니다.
//     return false;
//   }
// }
}
