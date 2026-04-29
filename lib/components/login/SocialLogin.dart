import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          children: const [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("OR"),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                print("Google Login");
              },
              icon: const Icon(Icons.g_mobiledata, size: 28),
              label: const Text("Google"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                print("Apple Login");
              },
              icon: const Icon(Icons.apple),
              label: const Text("Apple"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}