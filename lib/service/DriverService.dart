import 'package:driver_app/data/MockDriverData.dart';
import 'package:driver_app/model/Driver.dart';

class DriverService {

  //final MockDriverData mockDriverData = MockDriverData();

  Future<Driver?> login(String input, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      return MockDriverData.drivers.firstWhere(
        (driver) =>
            (driver.phone == input || driver.email == input) &&
            driver.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}