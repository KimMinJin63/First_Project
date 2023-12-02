import 'package:first_project/controller/map_controller.dart';
import 'package:first_project/model/district.dart';
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
      body: Obx(
        () => GoogleMap(
          onMapCreated: (controller) {
            mapController = controller;
          },
          markers: controller.markers.toSet(),
          onTap: (coordinate) {
            mapController!.animateCamera(CameraUpdate.newLatLng(coordinate));
            // mapController!.animateCamera(CameraUpdate.newLatLng(coordinate));
            // controller.addMarker(coordinate as District);
            // print('마커 리스트 : ${controller.markers}');
          },
          initialCameraPosition: CameraPosition(
            zoom: 17,
            target: LatLng(35.883464, 128.630775),
          ),
        ),
      ),
    );
  }
}
