import 'package:delivery/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title});

  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapCtrl = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Location',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 252, 147, 77),
      ),
      body: Obx(() => GoogleMap(
            onMapCreated: mapCtrl.onMapCreated,
            initialCameraPosition: CameraPosition(
              target: mapCtrl.currentLocation.value,
              zoom: 11.0,
            ),
          )),
    );
  }
}
