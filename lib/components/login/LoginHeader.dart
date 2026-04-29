import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 200,
      left: 35,
      child: Text(
        "Welcome!",
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}