import 'package:driver_app/components/driver_details/DriverDetailsEditableField.dart';
import 'package:driver_app/components/driver_details/DriverDetailsLogOutButton.dart';
import 'package:driver_app/components/driver_details/DriverDetailsProfileImage.dart';
import 'package:driver_app/components/driver_details/DriverDetailsSaveButton.dart';
import 'package:driver_app/service/AppStateService.dart';
import 'package:driver_app/service/SessionService.dart';
import 'package:flutter/material.dart';


class DriverDetailsScreen extends StatefulWidget {
  const DriverDetailsScreen({super.key});

  @override
  State<DriverDetailsScreen> createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  bool isEditing = false;

  final firstNameController = TextEditingController(text: AppStateService.currentDriver?.firstName);
  final lastNameController = TextEditingController(text: AppStateService.currentDriver?.lastName);
  final phoneController = TextEditingController(text: AppStateService.currentDriver?.phone);
  final licenseController = TextEditingController(text: AppStateService.currentDriver?.licenceNumber);
  final addressController = TextEditingController(text: AppStateService.currentDriver?.address?.streetLine1);
  final emailController = TextEditingController(text: AppStateService.currentDriver?.email);

  final sessionService = SessionService();

  void onSave() {
    AppStateService.updateDriver(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      //address: addressController.text,
    );

    AppStateService.syncDriverToMockData();

    final driver=AppStateService.currentDriver!;
    firstNameController.text = driver.firstName;
    lastNameController.text = driver.lastName;
    emailController.text = driver.email;

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Driver updated successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Details"),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.close : Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 20),

            // 🔹 Profile Image
            const DriverDetailsProfileImage(),

            const SizedBox(height: 20),

            // 🔹 Fields
            DriverDetailsEditableField(
              label: "First Name",
              controller: firstNameController,
              isEditing: isEditing,
            ),

            DriverDetailsEditableField(
              label: "Last Name",
              controller: lastNameController,
              isEditing: isEditing,
            ),

            DriverDetailsEditableField(
              label: "Email", 
              controller: emailController, 
              isEditing: isEditing
            ),

            DriverDetailsEditableField(
              label: "Phone",
              controller: phoneController,
              isEditing: false,
            ),

            DriverDetailsEditableField(
              label: "License",
              controller: licenseController,
              isEditing: false,
            ),
            

            DriverDetailsEditableField(
              label: "Address", 
              controller: addressController, 
              isEditing: isEditing
            ),
            

            const SizedBox(height: 20),

            // 🔹 Save Button
            if (isEditing)
              DriverDetailsSaveButton(
                onSave: () {
                  onSave();
                  setState(() {
                    isEditing = false;
                  });
                },
              ),
            
            // logoutbutton

            const SizedBox(height: 10),

            const DriverDetailsLogOutButton(),

          ],
        ),
      ),
    );
  }
}