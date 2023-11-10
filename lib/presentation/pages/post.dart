import 'dart:async';

import 'package:event_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

    @override
  void initState() {
    super.initState();
    locatePosition();
  }


  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();


  LatLng center = LatLng(0.00, 0.00);

  bool mapLoading = true;

  void locatePosition() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    await Geolocator.checkPermission();
    LocationPermission x = await Geolocator.requestPermission();
    if (x == LocationPermission.deniedForever ||
        x == LocationPermission.denied) {
      showToast(msg: "Permission toh dedo");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);


    center =  LatLng(position.latitude, position.longitude ) ;

    setState(() {
      mapLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: (mapLoading)
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: center,
                zoom: 10.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('Home'),
                  position: center ,
                )
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
    ));
  }
}
