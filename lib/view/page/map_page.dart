import 'package:first_project/controller/map_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/page/map_find_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends GetView<MapController> {
  const MapPage({super.key});
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
                    color: AppColor.white,
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
        ],
      ),
    );
  }
}
