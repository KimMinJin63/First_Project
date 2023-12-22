import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/page/detail_restaurant_page.dart';
import 'package:first_project/view/page/marker_detail_page.dart';
import 'package:first_project/view/page/review_detail_page.dart';
import 'package:flutter/material.dart';
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
  GoogleMapController? _controller;
  District? selectedRestaurant;
  // GoogleMapController? get controller => _controller;

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
    update();
  }

  Future<void> initMarkerFromAddress(String address, String name) async {
    try {
      Map<String, dynamic> latLng = await getLatLngFromAddress(address);
      double latitude = latLng['latitude'];
      double longitude = latLng['longitude'];

      int markerId = Random().nextInt(100);

      // District restaurant = District(
      //     name: name, address: address); // Create a restaurant instance
      // selectedRestaurant = restaurant; // Set the selected restaurant

      markers.add(
        Marker(
            // onTap: () {
            //   print('눌리니?');
            //   Get.to(
            //     MarkerDetailPage.route,
            //     arguments: restaurant, // 이 부분이 추가된 부분
            //   );
            // },
          markerId: MarkerId(markerId.toString()),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(
            // onTap: () {
            //   print('눌리니?');
            //   Get.to(
            //     MarkerDetailPage.route,
            //     arguments: restaurant, // 이 부분이 추가된 부분
            //   );
            // },
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
    final apiKey = 'AIzaSyCRni83jUNvpoAtGwJuE7E9U0-PkCi3aJw';
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


// Future<void> getMarkerData(double userLatitude, double userLongitude) async {
//   try {
//     double radiusInKm = 5.0;

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
//           .where('location',
//               isGreaterThanOrEqualTo: getMinPoint(
//                   userLatitude, userLongitude, radiusInKm))
//           .where('location',
//               isLessThanOrEqualTo: getMaxPoint(
//                   userLatitude, userLongitude, radiusInKm))
//           .get();
          

//       print('지도 스냅샷 : ${snapshot.docs}');
//       if (snapshot.docs.isNotEmpty) {
//         for (int i = 0; i < snapshot.docs.length; i++) {
//           Map<String, dynamic> data =
//               (snapshot.docs[i].data() as Map<String, dynamic>);
//           String address = data['address'] ?? '주소 없음';
//           String name = data['name'] ?? '이름 없음';
//           print('이름 : $name');
//           print('주소 : $address');

//           // 여기서 원하는 작업 수행
//           await initMarkerFromAddress(address, name);
//         }
//       }
//     }
//   } catch (e) {
//     print("Error getting location: $e");
//   }
// }

// GeoPoint getMinPoint(double latitude, double longitude, double radiusInKm) {
//   double latOffset = radiusInKm / 110.54;
//   double lonOffset = radiusInKm / (111.320 * cos(latitude));
//   double minLat = latitude - latOffset;
//   double minLon = longitude - lonOffset;
//   return GeoPoint(minLat, minLon);
// }

// GeoPoint getMaxPoint(double latitude, double longitude, double radiusInKm) {
//   double latOffset = radiusInKm / 110.54;
//   double lonOffset = radiusInKm / (111.320 * cos(latitude));
//   double maxLat = latitude + latOffset;
//   double maxLon = longitude + lonOffset;
//   return GeoPoint(maxLat, maxLon);
// }
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
          print('주소 : $address');

          await initMarkerFromAddress(address, name);
        }
      }
    }
  }
  // Future<void> getMarkerData() async {
  //   for (var collectionName in [
  //     '동구',
  //     '서구',
  //     '남구',
  //     '북구',
  //     '중구',
  //     '달서구',
  //     '수성구',
  //     '달성군',
  //   ]) {
  //     QuerySnapshot snapshot =
  //         await FirebaseFirestore.instance.collection(collectionName).get();
  //     print('지도 스냅샷 : ${snapshot.docs}');
  //     if (snapshot.docs.isNotEmpty) {
  //       for (int i = 0; i < snapshot.docs.length; i++) {
  //         Map<String, dynamic> data =
  //             (snapshot.docs[i].data() as Map<String, dynamic>);
  //         String address = data['address'] ?? '주소 없음';
  //         String name = data['name'] ?? '이름 없음';
  //         print('이름 : $name');
  //         print('주소 : $address');

  //         await initMarkerFromAddress(address, name);
  //       }
  //     }
  //   }
  // }

//식당 검색시 결과 보여주는 코드
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
            .where('name', isGreaterThanOrEqualTo: findRestaurants.value)
            .where('name',
                isLessThanOrEqualTo: '${findRestaurants.value}\uf8ff')
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

  // Future<void> getRestaurantData() async {
  //   final double radius = 2.0; // 반경 2km
  //   final CollectionReference restaurantsCollection =
  //       FirebaseFirestore.instance.collection('restaurants');

  //   isLoading.value = true;

  //   try {
  //     QuerySnapshot restaurantsSnapshot = await restaurantsCollection.get();
  //     List<DocumentSnapshot> restaurantsDocs = restaurantsSnapshot.docs;

  //     restaurantList.clear();

  //     for (DocumentSnapshot restaurantDoc in restaurantsDocs) {
  //       String address = restaurantDoc['address'];
  //       print(address);

  //       // 주소만을 restaurantList에 추가
  //       restaurantList.add({
  //         'address': address,
  //       });
  //     }

  //     isLoading.value = false;
  //     // ... (나머지 부분은 restaurantList를 사용하여 지도에 마커를 추가하는 등의 코드)
  //   } catch (e) {
  //     print('오류: $e');
  //   }
  // }

//지도 이동시 주소를 위도와 경도로 바꾸는 과정
  void moveToRestaurantLocation(
      BuildContext context, District restaurant) async {
    try {
      Map<String, dynamic> latLng =
          await getLatLngFromAddress(restaurant.address ?? '주소없음');
      print('_______?$latLng');
      print('---------${restaurant.address}');
      if (latLng != null) {
        double latitude = latLng['latitude'];
        double longitude = latLng['longitude'];
        await moveToLocation(latitude, longitude);
        openBottomSheet(context, restaurant);
        // openDialog(context, restaurant);
        print('-------------- $latLng');
      } else {
        print('주소 변환 결과가 null입니다.');
      }
    } catch (e) {
      print('주소를 변환하는 도중 오류가 발생했습니다: $e');
    }
  }

//바뀐 위도와 경도를 이용해서 지도 이동하기
  Future<void> moveToLocation(double latitude, double longitude) async {
    try {
      if (_controller != null) {
        await _controller!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 18.0,
          ),
        ));
      } else {
        print('GoogleMapController가 초기화되지 않았습니다. 대기 후 다시 시도합니다.');
      }
    } catch (e) {
      print('지도 이동 중 오류: $e');
    }
  }

  @override
  void onInit() {
    getMarkerData();
    // getMarkerData(35.883464, 128.630775);
    print('onInit 호출');
    super.onInit();
  }

  void openDialog(BuildContext context, District restaurant) {
    Get.dialog(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            height: 230,
            padding: const EdgeInsets.all(26),
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.all(Radius.circular(26))),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            restaurant.name!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(restaurant.category!)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(restaurant.address!),
                    Text(restaurant.telNum!),
                    Text(restaurant.time!),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //  });
  }

  // void openBottomSheet(BuildContext context, District restaurant) {
  //   Future.delayed(Duration.zero, () {
  //     Get.bottomSheet(Container(
  //       height: 230,
  //       padding: const EdgeInsets.all(26),
  //       decoration: const BoxDecoration(
  //           color: AppColor.white,
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         height: 200,
  //         child: Column(
  //           children: [
  //             Text(
  //               restaurant.name!,
  //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 15,
  //             ),
  //             Text(restaurant.address!),
  //             Text(restaurant.telNum!)
  //           ],
  //         ),
  //       ),
  //     ));
  //   });
  // }
  void openBottomSheet(BuildContext context, District restaurant) {
    // Future.delayed(Duration.zero, () {
    Get.bottomSheet(Container(
      height: 230,
      padding: const EdgeInsets.all(26),
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    restaurant.name!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(restaurant.category!)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(restaurant.address!),
            Text(restaurant.telNum!),
            Text(restaurant.time!),
            TextButton(
                onPressed: () {
                  Get.toNamed(
                    MarkerDetailPage.route,
                    arguments: restaurant,
                  );
                },
                child: const Text('자세히보기 >>>'))
          ],
        ),
      ),
    ));
    // });
  }
}
