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
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  RxList<Marker> markers = <Marker>[].obs;
  RxString findAddress = ''.obs;

Future<void> initMarkerFromAddress(String address, String name) async {
  try {
    List<Location> locations = await locationFromAddress(address);
    print('로케이션 : $locations');
    if (locations.isNotEmpty) {
      Location location = locations.first;
      int markerId = Random().nextInt(100);
      markers.add(
        Marker(
          markerId: MarkerId(markerId.toString()),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(
            title: name,
            snippet: address,
          ),
        ),
      );
    } else {
      print('해당 주소에 대한 좌표를 찾을 수 없습니다.');
    }
  } catch (e) {
    print('오류: $e');
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
            print('주소 : $address');
            print('이름 : $name');


            await initMarkerFromAddress(address, name);
          }
        }
      }
  }

  @override
  void onInit() {
    getMarkerData();
    print('onInit 호출');
    super.onInit();
  }
}
