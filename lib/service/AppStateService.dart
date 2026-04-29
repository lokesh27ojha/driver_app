import 'package:driver_app/data/MockDriverData.dart';
import 'package:driver_app/model/Address.dart';
import 'package:driver_app/model/Driver.dart';
import 'package:driver_app/model/DriverState.dart';
import 'package:driver_app/model/RideRequest.dart';

class AppStateService{

  static Driver? currentDriver;
  static RideRequest? currentRide;

  static DriverState driverState= DriverState.OFFLINE;

  static dynamic currentRequest;

  static void setDriver(Driver driver){
    currentDriver=driver;
  }

  static void setState(DriverState state){
    driverState=state;
  }

  static void setRequest(dynamic request){
    currentRequest= request;
  }

  static void clearRequest(){
    currentRequest=null;
  }

  static void clearDriver() {
  currentDriver = null;
}

  static void setRide(RideRequest ride){
    currentRide =ride;
  }
  
  static void clearRide(){
    currentRide=null;
  }

  static void updateDriver({String? firstName, String? lastName, String? email, Address? address}){
    if(currentDriver!=null){
      if (firstName != null) currentDriver!.firstName = firstName;
      if (lastName != null) currentDriver!.lastName = lastName;
      if (email != null) currentDriver!.email = email;
      if (address != null) currentDriver!.address=address;
    }
  }

  static void syncDriverToMockData(){
    if(currentDriver==null) return;

    int index= MockDriverData.drivers.indexWhere(
      (d) => d.driverId == currentDriver!.driverId,
    );

    if(index!=-1){
      MockDriverData.drivers[index].firstName=currentDriver!.firstName;
      MockDriverData.drivers[index].lastName=currentDriver!.lastName;
      MockDriverData.drivers[index].email=currentDriver!.email;
      MockDriverData.drivers[index].address=currentDriver!.address;
    }

  }

}