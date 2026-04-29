import 'dart:async';
import 'dart:convert';

import 'package:driver_app/model/DriverState.dart';
import 'package:driver_app/model/RideRequest.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart' hide Marker;

class HomeMapSection extends StatefulWidget {
  final DriverState status;
  final RideRequest? ride;

  const HomeMapSection({
    super.key,
    required this.status,
    required this.ride,
  });

  @override
  State<HomeMapSection> createState() => _HomeMapSectionState();
}

class _HomeMapSectionState extends State<HomeMapSection> {
  GoogleMapController? mapController;
  LatLng? currentPos;
  Set<Polyline> polylines = {};

  StreamSubscription<Position>? positionStream;

  @override
  void initState() {
    super.initState();
    _startLocationUpdate();
  }

  @override
  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }

  // 🔥 Handles state change safely (NOT in build)
  @override
  void didUpdateWidget(covariant HomeMapSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.status != widget.status) {
      _handleStateChange();
    }
  }

  void _handleStateChange() {
    if (widget.ride == null || currentPos == null) return;

    if (widget.status == DriverState.GOING_TO_PICKUP) {
      _drawRoute(currentPos!, widget.ride!.pickupAddress.cordinate);
    }

    if (widget.status == DriverState.ON_TRIP) {
      _drawRoute(
        widget.ride!.pickupAddress.cordinate,
        widget.ride!.dropAddress.cordinate,
      );
    }
  }

  Future<void> _drawRoute(LatLng from, LatLng to) async {
    final apiKey = "AIzaSyA56YKW6VDfc0BBGdH80zxN2JY6R5nrgZk"; 

    final url =
        "https://maps.googleapis.com/maps/api/directions/json?"
        "origin=${from.latitude},${from.longitude}"
        "&destination=${to.latitude},${to.longitude}"
        "&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print("❌ Failed to fetch route");
      return;
    }

    final data = jsonDecode(response.body);

    if (data["status"] != "OK") {
      print("❌ API ERROR: ${data["status"]}");
      return;
    }

    final points = data["routes"][0]["overview_polyline"]["points"];
    final decodedPoints = _decodePolyline(points);

    setState(() {
      polylines = {
        Polyline(
          polylineId: const PolylineId("route"),
          points: decodedPoints,
          width: 5,
        ),
      };
    });

    print("📡 CALLING API: $from → $to");
    print("📡 RESPONSE: ${response.body}");

    // 🔥 Wait for map to be ready before camera move
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mapController == null) return;

      mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              from.latitude < to.latitude ? from.latitude : to.latitude,
              from.longitude < to.longitude ? from.longitude : to.longitude,
            ),
            northeast: LatLng(
              from.latitude > to.latitude ? from.latitude : to.latitude,
              from.longitude > to.longitude ? from.longitude : to.longitude,
            ),
          ),
          120,
        ),
      );
    });
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      poly.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return poly;
  }

  Future<void> _startLocationUpdate() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      final newPos = LatLng(position.latitude, position.longitude);

      setState(() {
        currentPos = newPos;
      });

      // 🔥 Only follow driver when idle
      if (widget.status == DriverState.ONLINE) {
        mapController?.animateCamera(
          CameraUpdate.newLatLng(newPos),
        );
      }

      if (widget.ride != null) {
  if (widget.status == DriverState.GOING_TO_PICKUP && polylines.isEmpty) {
    print("🔁 RETRY: Driver → Pickup");
    _drawRoute(currentPos!, widget.ride!.pickupAddress.cordinate);
  }

  if (widget.status == DriverState.ON_TRIP && polylines.isEmpty) {
    print("🔁 RETRY: Pickup → Drop");
    _drawRoute(
      widget.ride!.pickupAddress.cordinate,
      widget.ride!.dropAddress.cordinate,
    );
  }
}

    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.status == DriverState.OFFLINE) {
      return const Center(
        //child: Lottie.asset("assets/gif/internet.json"),
        child: Text("OFFLINE!")
      );
    }

    if (currentPos == null) {
      return const Center(
        //child: Lottie.asset("assets/gif/location.json"),
        child: CircularProgressIndicator(),
      );
    }

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: currentPos!,
        zoom: 14,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: (controller) {
        mapController = controller;
      },
      markers: {
        Marker(
          markerId: const MarkerId("current"),
          position: currentPos!,
        ),

        // 🔥 GOING TO PICKUP
        if (widget.ride != null &&
            widget.status == DriverState.GOING_TO_PICKUP)
          Marker(
            markerId: const MarkerId("pickup"),
            position: widget.ride!.pickupAddress.cordinate,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
          ),

        // 🔥 ON TRIP (both markers)
        if (widget.ride != null &&
            widget.status == DriverState.ON_TRIP) ...[
          Marker(
            markerId: const MarkerId("pickup"),
            position: widget.ride!.pickupAddress.cordinate,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
          ),
          Marker(
            markerId: const MarkerId("drop"),
            position: widget.ride!.dropAddress.cordinate,
          ),
        ],
      },
      polylines: polylines,
    );
  }
}