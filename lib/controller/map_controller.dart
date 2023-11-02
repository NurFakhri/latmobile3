import 'package:delivery/model/map_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final locationModel = LocationModel();

  var currentLocation = LatLng(45.521563, -122.67733).obs;

  void onMapCreated(GoogleMapController controller) {
    // Anda dapat menambahkan lebih banyak logika di sini jika diperlukan
  }

  void updateLocation(LatLng newLocation) {
    currentLocation.value = newLocation;
    locationModel.currentLocation = newLocation;
  }
}
