import 'package:first_project/controller/map_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/page/map_find_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends GetView<MapController> {
  const MapPage({Key? key}) : super(key: key);

  static const route = '/mapPage';

  @override
  Widget build(BuildContext context) {
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
              // onMapCreated: (controller) {
              //   // MapController의 onMapCreated 메서드 호출
              //   controller.onMapCreated(controller);
              // },
              markers: controller.markers.toSet(),
            ),
          ),
          // 추가: 마커를 눌렀을 때 바텀 시트를 띄우는 GestureDetector
          GestureDetector(
            onTap: () {
              if (controller.selectedRestaurant != null) {
                // 마커를 탭하면 해당 레스토랑 정보로 바텀 시트를 엽니다.
                controller.openBottomSheet(context, controller.selectedRestaurant!);
              }
            },
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.place,
                color: Colors.red,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
