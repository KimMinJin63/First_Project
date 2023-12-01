import 'dart:math';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController{
    RxList<Marker> markers = <Marker>[].obs;

   addMarker(cordinate) {
    int id = Random().nextInt(100);

    markers.add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
   }
}