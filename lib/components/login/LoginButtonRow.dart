import 'package:flutter/material.dart';

class LoginButtonRow extends StatelessWidget {
  final VoidCallback onLogin;

  const LoginButtonRow({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sign In",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade900,
          ),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.shade900,
          child: IconButton(
            color: Colors.white,
            onPressed: onLogin,
            icon: const Icon(Icons.arrow_forward_rounded),
          ),
        )
      ],
    );
  }
}