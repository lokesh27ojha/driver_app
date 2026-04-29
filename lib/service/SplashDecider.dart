import 'package:driver_app/data/MockDriverData.dart';
import 'package:driver_app/model/Driver.dart';
import 'package:driver_app/screens/HomeScreen.dart';
import 'package:driver_app/screens/LiveLocation.dart';
import 'package:driver_app/screens/loginScreen.dart';
import 'package:driver_app/service/SessionService.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/service/AppStateService.dart';
import 'package:driver_app/model/DriverState.dart';

class SplashDecider extends StatefulWidget {
  const SplashDecider({super.key});

  @override
  State<SplashDecider> createState() => _SplashDeciderState();
}

class _SplashDeciderState extends State<SplashDecider> {


  final sessionService =SessionService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {

  bool isLoggedIn = await sessionService.isLoggedIn();

  if (isLoggedIn) {

    String? email = await sessionService.getDriverEmail();

    if (email != null) {

      Driver driver = MockDriverData.drivers.firstWhere(
        (d) => d.email == email,
      );

      // 🔥 RESTORE STATE
      AppStateService.setDriver(driver);
      AppStateService.setState(DriverState.OFFLINE);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

    } else {
      goToLogin();
    }

  } else {
    goToLogin();
  }
}

void goToLogin() {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}