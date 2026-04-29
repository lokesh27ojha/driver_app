//import 'package:driver_app/screens/DriverHomeScreen.dart';
import 'package:driver_app/screens/DriverDetailsScreen.dart';
import 'package:driver_app/screens/EarningScreen.dart';
import 'package:driver_app/screens/HomeScreen.dart';
import 'package:driver_app/screens/LoginScreen.dart';
import 'package:driver_app/screens/ProfileScreen.dart';
import 'package:driver_app/screens/SignUpScreen.dart';
import 'package:driver_app/screens/LiveLocation.dart';
import 'package:driver_app/service/SplashDecider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashDecider(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/login" : (context) => LoginScreen(),
        "/signup" : (context) => SignUpScreen(),
        "/profile" : (context) => ProfileScreen(),
        "/home" : (context) => HomeScreen(),
        "/details" : (context) => DriverDetailsScreen(),
        "/earning" : (context) => EarningsScreen(),
        "/live" : (context) => LiveLocation()

      },
    );
  }
}
