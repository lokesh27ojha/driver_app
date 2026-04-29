import 'package:driver_app/data/MockAddressData.dart';
import 'package:driver_app/model/Address.dart';
import 'package:driver_app/model/Driver.dart';

class MockDriverData{

  static final Address address1 = MockAddressData.addresses[0];
  static final Address address2 = MockAddressData.addresses[1];
  
  static final List<Driver> drivers=[

    Driver(driverId: 1, firstName: "Lokesh", lastName: "ojha", email: "lokesh27ojha@gmail.com", phone: "8171422287", address: address1, password: "lokesh", licenceNumber: "UK07BT"),
    Driver(driverId: 2, firstName: "Mohan", lastName: "Sharma", email: "mohan@gmail.com", phone: "987654321", address: address2, password: "mohan", licenceNumber: "HR55A")
  ];

  // static void printTheLatestDriver(){
  //   print("Latest driver:::::::: ${drivers[drivers.length-1].firstName} ${drivers[drivers.length-1].email} ${drivers[drivers.length-1].password}");
  // }
  


}

// void main(){
//     print(MockDriverData.drivers[0].email);
//     print(MockDriverData.drivers[0].password);
// }