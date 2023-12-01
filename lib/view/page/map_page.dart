import 'package:first_project/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends GetView<MapController> {
  const MapPage({super.key});
  static const route = '/mapPage';

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    return Scaffold(
      body: GoogleMap(
        markers: controller.markers.toSet(),
        initialCameraPosition: 
        CameraPosition(
          zoom: 17,
          target: LatLng(35.861660, 128.580502))),
    );
  }
}