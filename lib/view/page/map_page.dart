import 'package:first_project/controller/map_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/page/map_find_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends GetView<MapController> {
  const MapPage({Key? key}) : super(key: key);

  static const route = '/mapPage';

  @override
  Widget build(BuildContext context) {
    GoogleMapController? mapController;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 60, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(MapFindPage.route);
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              myLocationButtonEnabled: true,
              initialCameraPosition: const CameraPosition(
                zoom: 16,
                target: LatLng(35.883464, 128.630775),
              ),
              onTap: (coordinate) {
                // mapController 변수를 사용
                if (mapController != null) {
                  mapController!
                      .animateCamera(CameraUpdate.newLatLng(coordinate));
                }
              },
              onMapCreated: (controllers) {
                // 전역 변수에 할당
                mapController = controllers;
                // MapController의 onMapCreated 메서드 호출
                controller.onMapCreated(controllers);
              },
              markers: controller.markers.toSet(),
            ),
          ),
          Positioned(
              left: Get.size.width / 3.5,
          bottom: 20,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      print('버튼 눌림');
                      // 사용자의 현재 위치를 얻어오는 로직 (예: geolocator 패키지 사용)
                      
                      double userLatitude = 35.883464;
                      double userLongitude =  128.630775;

                      // MapController의 getMarkerData 메서드 호출
                      controller.getMarkerData();
                      // controller.getMarkerData(userLatitude, userLongitude);
                    },
                    child: Obx(() => controller.isLoading.value
                        ? const CupertinoActivityIndicator() // 로딩 중인 경우 표시
                        : const Text(
                            '주변 가까운 충전소',
                            style: TextStyle(color: Colors.white),
                          )),
                  )))
          // 추가: 마커를 눌렀을 때 바텀 시트를 띄우는 GestureDetector
          // GestureDetector(
          //   onTap: () {
          //     if (controller.selectedRestaurant != null) {
          //       // 마커를 탭하면 해당 레스토랑 정보로 바텀 시트를 엽니다.
          //       controller.openBottomSheet(context, controller.selectedRestaurant!);
          //     }
          //   },
          //   child: Align(
          //     alignment: Alignment.center,
          //     child: Icon(
          //       Icons.place,
          //       color: Colors.red,
          //       size: 40.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
