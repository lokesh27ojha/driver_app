import 'package:google_maps_flutter/google_maps_flutter.dart';

class
 Address {

  final int addressId;
  final String streetLine1;
  String? streetLine2;
  final String city;
  final String state;
  final String pincode;
  final LatLng cordinate;

  Address({
    required this.addressId,
    required this.streetLine1, 
    this.streetLine2, 
    required this.city, 
    required this.state, 
    required this.pincode,
    required this.cordinate
  });

  

}