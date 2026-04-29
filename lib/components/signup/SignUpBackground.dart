import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  final Widget child;

  const SignUpBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/register.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}