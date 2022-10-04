import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTester extends StatefulWidget {
  const MapTester({Key? key}) : super(key: key);

  @override
  State<MapTester> createState() => _MapTesterState();
}

class _MapTesterState extends State<MapTester> {
//   double lat = "103.81743274072267" as double;
// double lang = "1.354313975537631" as double;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.satellite,
          compassEnabled: true,
          zoomControlsEnabled: false,

          onMapCreated: (GoogleMapController controller) {
            // _controller.complete(controller);
            Completer<GoogleMapController> _controller =
            Completer();
            _controller.complete(controller);
          },
          initialCameraPosition: CameraPosition(
              // target: LatLng(103.81743274072267,
              //     1.354313975537631),
              target: LatLng(33.7293882, 73.09314610000001),
              zoom: 10)),
    );
  }
}
