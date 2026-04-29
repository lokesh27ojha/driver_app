import 'package:flutter/material.dart';
import 'package:driver_app/service/AppStateService.dart';

class HomeTopBar extends StatelessWidget {
  final String name;
  final String license;
  final String imagePath;
  final VoidCallback onProfileTap;

  const HomeTopBar({
    super.key,
    required this.name,
    required this.license,
    required this.imagePath,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          //  Name + License
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStateService.currentDriver?.firstName ?? "Driver",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                AppStateService.currentDriver?.licenceNumber ?? "N/A",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),

          // 🔹 Profile Image
          GestureDetector(
            onTap: onProfileTap,
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(imagePath),
            ),
          )
        ],
      ),
    );
  }
}