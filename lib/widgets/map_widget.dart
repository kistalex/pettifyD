import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRouter extends StatefulWidget {
  const MapRouter({Key? key}) : super(key: key);

  @override
  State<MapRouter> createState() => _PlacesMapWidgetState();
}

class _PlacesMapWidgetState extends State<MapRouter> {
  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
  }

  static final CameraPosition _moscow = CameraPosition(
    target: LatLng(55.71, 37.61),
    zoom: 14.4748,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _moscow,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _getCurrentPosition() async {
    Position? position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 14)));
    }).catchError((e) {
      print(e);
    });
  }
}
  // void getlocation() async {
  //   LocationPermission per = await Geolocator.checkPermission();
  //   if (per == LocationPermission.denied ||
  //       per == LocationPermission.deniedForever) {
  //     await Geolocator.requestPermission();
  //   } else {
  //     Position currentLoc = await Geolocator.getCurrentPosition(
  //             desiredAccuracy: LocationAccuracy.best)
  //         .then((Position currentLoc) async {
  //       final GoogleMapController controller = await _controller.future;
  //       controller.animateCamera((CameraUpdate.newCameraPosition(CameraPosition(
  //           target: LatLng(currentLoc.latitude, currentLoc.longitude),
  //           zoom: 14))));
  //     }).catchError((e){
  //       print(e);
  //     });
  //   }
  // }

