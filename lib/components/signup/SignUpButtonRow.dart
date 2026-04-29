import 'package:flutter/material.dart';

class SignUpButtonRow extends StatelessWidget {
  final VoidCallback onPressed;

  const SignUpButtonRow({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sign Up",
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
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_forward_rounded),
          ),
        )
      ],
    );
  }
}