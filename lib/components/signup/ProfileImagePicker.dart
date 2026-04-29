import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onEdit;

  const ProfileImagePicker({
    super.key,
    required this.imageFile,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            backgroundImage:
                imageFile != null 
                ? FileImage(imageFile!) 
                : AssetImage("assets/img/defaultdriverpic.jpg") as ImageProvider,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onEdit,
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black,
                child: Icon(Icons.edit, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}