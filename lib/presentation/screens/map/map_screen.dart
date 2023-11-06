import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/screens/layout/home/components/home_imports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget {
  final double? title , body;
  const MapScreen({Key? key,   this.title, this.body}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Set<Polyline> _polylines = {};
  String distance = '';
  String duration = '';

  // dafault position //
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  // determine the permission //
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
  // determine the current location //
  Future<void> _setCurrentLocation() async {
    Position position = await determinePosition();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                position.latitude ,
                position.longitude ), zoom: 14)));
    debugPrint(
        '--------------------${position.latitude.toString()}------------------',
        wrapWidth: 100);
    debugPrint(
        '--------------------${position.longitude.toString()}------------------',
        wrapWidth: 100);
    markers.clear();
    markers.addAll(<Marker>{
      Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: const InfoWindow(title: 'My Location')),
      const Marker(
          markerId: MarkerId('anotherLocation'),
          position: LatLng(31.4167, 31.8214),
          infoWindow: InfoWindow(title: 'Another Location')),
    }
    );
    setState(() {});
  }
  // draw line between two points //
  void drawPolyline(Position start, LatLng end) {
    PolylineId id = const PolylineId('poly');
    List<LatLng> points = <LatLng>[];
    points.add(LatLng(start.latitude, start.longitude));
    points.add(end);
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.purple,
      points: points,
      width: 5,
    );

    setState(() {
      _polylines.add(polyline);
    });
  }
  // calculate Distance And Time between two points //
  Future<void> calculateDistanceAndTime() async {
    Position position = await determinePosition();
    double destinationLatitude = 31.4167;
    double destinationLongitude = 31.8214;

    double distanceInMeters = Geolocator.distanceBetween(
      position.latitude ,
      position.longitude,
      destinationLatitude,
      destinationLongitude,
    );

    double distanceInKilometers = distanceInMeters / 1000;

    double averageSpeed = 50.0; // Average driving speed in km/h
    double estimatedTimeInHours = distanceInKilometers / averageSpeed;

    int estimatedTimeInMinutes = (estimatedTimeInHours * 60).toInt();

    setState(() {
      distance = 'Distance: ${distanceInKilometers.toStringAsFixed(2)} km';
      duration = 'Estimated Time: $estimatedTimeInMinutes minutes';
    });
    drawPolyline(position, LatLng(destinationLatitude, destinationLongitude));
  }

  @override
  void initState() {
    super.initState();
    _setCurrentLocation();
    calculateDistanceAndTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            polylines: _polylines,
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
          ),
          Positioned(
           bottom: 0,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: distance,
                      textWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: duration,
                      textWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

