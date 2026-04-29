import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 200,
      left: 35,
      child: Text(
        "Register!",
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}