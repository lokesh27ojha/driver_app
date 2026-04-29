import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  final String imagePath;

  const FullImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: GestureDetector(
        onTap: () {
          Navigator.pop(context); // tap outside closes
        },

        child: Stack(
          children: [

            // 🌑 DARK TRANSPARENT BACKGROUND
            Container(
              color: Colors.black.withOpacity(0.6),
            ),

            // 🖼️ CENTER CONTENT
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // 🖼️ SQUARE IMAGE (NO ROUND)
                  Hero(
                    tag: "profilePic",
                    child: GestureDetector(
                      onTap: () {}, // prevent closing
                      child: Image.asset(
                        imagePath,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover, // 👈 fills square properly
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ✏️🗑️ ACTION BUTTONS BELOW IMAGE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // EDIT
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          // TODO: edit image
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text("Edit"),
                      ),

                      const SizedBox(width: 15),

                      // DELETE
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          // TODO: delete image
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("Delete"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ❌ BACK BUTTON (optional top-left)
            Positioned(
              top: 50,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}