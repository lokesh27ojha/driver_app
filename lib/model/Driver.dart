import 'package:driver_app/model/Address.dart';

class Driver {

  int? driverId;
  String firstName;
  String lastName;
  String email;
  final String phone;
  Address? address;
  String password;
  final String licenceNumber;
  String status;


  Driver({
    this.driverId,
    required this.firstName,
    required this.lastName, 
    required this.email,
    required this.phone,
    this.address,
    required this.password,
    required this.licenceNumber,
    this.status="AVAILABLE",
    });


}