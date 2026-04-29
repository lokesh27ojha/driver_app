import 'package:driver_app/model/Address.dart';
import 'package:driver_app/model/RideRequest.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MockRideRequestData {

  static Address pick1=Address(
    addressId: 1,
    streetLine1: "Delhi",
    city: "Delhi", 
    state: "Delhi", 
    pincode: "110001",
    cordinate: LatLng(28.704059, 77.102490)
  );

  static Address pick2=Address(
    addressId: 2,
    streetLine1: "Agra",
    city: "Agra", 
    state: "Agra", 
    pincode: "282001",
    cordinate: LatLng(27.176670, 78.008074)
  );

  static Address drop1=Address(
    addressId: 3,
    streetLine1: "Mumbai",
    city: "Mumbai", 
    state: "Mumbai", 
    pincode: "400001",
    cordinate: LatLng(18.958235, 72.831951)
  );

  static Address drop2=Address(
    addressId: 4,
    streetLine1: "Hyderabad",
    city: "Hyderabad", 
    state: "Hyderabad", 
    pincode: "500001",
    cordinate: LatLng(17.406498,78.477244)
  );
  
  static List<RideRequest> rideRequests =[

    RideRequest(
      rideRequestId: 1,
      pickupAddress: pick1, 
      pickupLocation: "Delhi", 
      dropAddress: drop1, 
      dropLocation: "Mumbai", 
      distance: 1000, 
      eta: 1200, 
      fare: 20000
    ),
    RideRequest(
      rideRequestId: 2,
      pickupAddress: pick2, 
      pickupLocation: "Agra", 
      dropAddress: drop2, 
      dropLocation: "Hyderabad", 
      distance: 1500, 
      eta: 1800, 
      fare: 30000
    ),
    RideRequest(
      pickupAddress: pick2, 
      pickupLocation: "Agra", 
      dropAddress: drop1, 
      dropLocation: "Mumbai", 
      distance: 1200, 
      eta: 1500, 
      fare: 25000
    ),
    
  ];

}