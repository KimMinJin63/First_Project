// import 'dart:async';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapController extends GetxController {
//   RxList<Marker> markers = <Marker>[].obs;
//   RxString findAddress = ''.obs;

//   // Future<void> initMarkerFromAddress(String address) async {
//   //   try {
//   //     List<Location> locations = await locationFromAddress(address);
//   //     print('로케이션 : $locations');
//   //     if (locations.isNotEmpty) {
//   //       Location location = locations.first;
//   //       int markerId = Random().nextInt(100);
//   //       markers.add(
//   //         Marker(
//   //           markerId: MarkerId(markerId.toString()),
//   //           position: LatLng(location.latitude, location.longitude),
//   //           infoWindow: InfoWindow(
//   //             title: '마커',
//   //             snippet: address,
//   //           ),
//   //         ),
//   //       );
//   //       print('잘 변환되었니? : ${markers.first}');
//   //     } else {
//   //       print('해당 주소에 대한 좌표를 찾을 수 없습니다.');
//   //     }
//   //   } catch (e) {
//   //     print('오류: $e');
//   //   }
//   // }

//   // Future<void> initMarker(Map<String, dynamic> data, String id) async {
//   //   try {
//   //     String address = data['address'] ?? '주소 없음';
//   //     print('$address');

//   //     // String address = data['address'] ?? '주소 없음';
//   //     List<Location> locations = await locationFromAddress(address);

//   //     if (locations.isNotEmpty) {
//   //       Location location = locations.first;
//   //       int markerId = Random().nextInt(100);
//   //       markers.add(
//   //         Marker(
//   //           markerId: MarkerId(markerId.toString()),
//   //           position: LatLng(location.latitude, location.longitude),
//   //           infoWindow: InfoWindow(
//   //             title: data['name'] ?? '이름 없음',
//   //             snippet: address,
//   //           ),
//   //         ),
//   //       );
//   //     } else {
//   //       print('Could not find coordinates for the address: $address');
//   //     }
//   //   } catch (e) {
//   //     print('Errorrr: $e');
//   //   }
//   // }

//   Future<void> getMarkerData() async {
//     // try {
//       for (var collectionName in [
//         '동구',
//         '서구',
//         '남구',
//         '북구',
//         '중구',
//         '달서구',
//         '수성구',
//         '달성군',
//       ]) {
//         QuerySnapshot snapshot =
//             await FirebaseFirestore.instance.collection(collectionName).get();
//             print('지도 스냅샷 : ${snapshot.docs}');
//         if (snapshot.docs.isNotEmpty) {
//           for (int i = 0; i < snapshot.docs.length; i++) {
//             Map<String, dynamic> data =
//                 (snapshot.docs[i].data() as Map<String, dynamic>);
//             String address = data['address'] ?? '주소 없음';
//             print('주소 : $address');

//             // List<Location> locations = await locationFromAddress(address);
//             // print('지도 로케이션스 : $locations');
//             if (address.isNotEmpty) {
//               Location? location;
//               int markerId = Random().nextInt(100);
//               markers.add(
//                 Marker(
//                   markerId: MarkerId(markerId.toString()),
//                   position: LatLng(location!.latitude, location.longitude),
//                   infoWindow: InfoWindow(
//                     title: data['name'] ?? '이름 없음',
//                     snippet: address,
//                   ),
//                 ),
//               );
//               // print('locations: $locations');
//             } else {
//               print('Could not find coordinates for the address: $address');
//             }
//           }
//         }
//       }
//     // } catch (e) {
//     //   print('Errorff: $e');

//     // }
//   }

//   @override
//   void onInit() {
//     getMarkerData();
//     print('onInit 호출');
//     // TODO: implement onInit
//     super.onInit();
//   }
// }

import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:first_project/model/district.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  RxList<Marker> markers = <Marker>[].obs;
  RxString findAddress = ''.obs;
  TextEditingController searchController = TextEditingController();
  RxString findRestaurants = ''.obs;
  RxList<District> searchResults = <District>[].obs;
  RxList restaurantList = [].obs;
  RxBool isLoading = false.obs;


 Future<void> initMarkerFromAddress(String address, String name) async {
    try {
      Map<String, dynamic> latLng = await getLatLngFromAddress(address);
      double latitude = latLng['latitude'];
      double longitude = latLng['longitude'];

      int markerId = Random().nextInt(100);
      markers.add(
        Marker(
          markerId: MarkerId(markerId.toString()),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(
            title: name,
            snippet: address,
          ),
        ),
      );
    } catch (e) {
      print('오류: $e');
    }
  }

  Future<Map<String, dynamic>> getLatLngFromAddress(String address) async {
    final apiKey = 'AIzaSyAVDtO5q1HORjAP0XP20HhDfU5zBQ-o00c'; // 본인의 Google Maps API 키로 대체
    final apiUrl = 'https://maps.googleapis.com/maps/api/geocode/json';

    try {
      Dio dio = Dio();
      final response = await dio.get('$apiUrl?address=$address&key=$apiKey');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        if (data['status'] == 'OK' && data['results'] != null) {
          final result = data['results'][0];
          final geometry = result['geometry'];
          final location = geometry['location'];

          double lat = location['lat'];
          double lng = location['lng'];

          return {'latitude': lat, 'longitude': lng};
        } else {
          throw Exception('Geocoding API returned an error: ${data['status']}');
        }
      } else {
        throw Exception('Failed to load geocoding data');
      }
    } catch (e) {
      throw Exception('Error during geocoding: $e');
    }
  }

    Future<void> getMarkerData() async {
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
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();
      print('지도 스냅샷 : ${snapshot.docs}');
      if (snapshot.docs.isNotEmpty) {
        for (int i = 0; i < snapshot.docs.length; i++) {
          Map<String, dynamic> data =
              (snapshot.docs[i].data() as Map<String, dynamic>);
          String address = data['address'] ?? '주소 없음';
          String name = data['name'] ?? '이름 없음';
          print('이름 : $name');

          await initMarkerFromAddress(address, name);
        }
      }
    }
  }

  findRestaurant() async {
    if (findRestaurants.value.isNotEmpty) {
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
            .where('name')
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

  Future<void> getRestaurantData() async {
    final double radius = 2.0; // 반경 2km
    final CollectionReference restaurantsCollection =
        FirebaseFirestore.instance.collection('restaurants');

    isLoading.value = true;

    try {
      QuerySnapshot restaurantsSnapshot = await restaurantsCollection.get();
      List<DocumentSnapshot> restaurantsDocs = restaurantsSnapshot.docs;

      restaurantList.clear();

      for (DocumentSnapshot restaurantDoc in restaurantsDocs) {
        String address = restaurantDoc['address'];
        print(address);

        // 주소만을 restaurantList에 추가
        restaurantList.add({
          'address': address,
        });
      }

      isLoading.value = false;
      // ... (나머지 부분은 restaurantList를 사용하여 지도에 마커를 추가하는 등의 코드)
    } catch (e) {
      print('오류: $e');
    }
  }

  @override
  void onInit() {
    getMarkerData();
    print('onInit 호출');
    super.onInit();
  }
}
