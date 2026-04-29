import 'package:driver_app/screens/FullImageScreen.dart';
import 'package:flutter/material.dart';

class DriverDetailsProfileImage extends StatelessWidget {
  const DriverDetailsProfileImage({super.key});


  final String imagePath = "assets/img/dp.jpg";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false, // 👈 IMPORTANT
                            pageBuilder: (_, __, ___) => FullImageScreen(
                              imagePath: imagePath,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: "profilePic",
                        child: ClipOval(
                          child: Image.asset(
                            imagePath,
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
    );
  }
}