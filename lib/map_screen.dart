import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  bool bToggle = true;
  Completer<GoogleMapController> _controller =
  Completer(); //refresh map when u zoom in or out

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 11.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: {
          Marker(
              markerId: MarkerId('I'),
              position: LatLng(30.033333, 31.233334),
              icon: BitmapDescriptor.defaultMarkerWithHue((bToggle)
                  ? BitmapDescriptor.hueBlue
                  : BitmapDescriptor.hueViolet),
              infoWindow: InfoWindow(title: 'Marker 1', snippet: ('my home'))),
          Marker(
              markerId: MarkerId('2'),
              position: LatLng(30.533333, 31.233334),
              icon: BitmapDescriptor.defaultMarkerWithHue((bToggle)
                  ? BitmapDescriptor.hueBlue
                  : BitmapDescriptor.hueViolet),
              infoWindow: InfoWindow(title: 'Marker 2', snippet: ('work'))),
          Marker(
              markerId: MarkerId('2'),
              position: LatLng(22.533333, 19.233334),
              icon: BitmapDescriptor.defaultMarkerWithHue((bToggle)
                  ? BitmapDescriptor.hueBlue
                  : BitmapDescriptor.hueViolet),
              infoWindow: InfoWindow(title: 'Marker 3', snippet: ('relstive')))


        },
        polylines: {
          Polyline(polylineId: PolylineId('1'),
              points: [LatLng(30.033333, 31.233334),LatLng(30.533333, 31.233334),LatLng(22.533333, 19.233334)],
              color: Colors.red,width: 2)
        },zoomControlsEnabled: false,zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}