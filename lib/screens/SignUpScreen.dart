import 'dart:io';
import 'package:driver_app/components/signup/GooglePlacesService.dart';
import 'package:driver_app/components/signup/SignUpTextField.dart';
// import 'package:driver_app/components/signup/SignupTextfield.dart';
import 'package:driver_app/data/MockAddressData.dart';
import 'package:driver_app/data/MockDriverData.dart';
import 'package:driver_app/model/Address.dart';
import 'package:driver_app/model/Driver.dart';
import 'package:driver_app/model/ProfilePic.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:driver_app/components/signup/SignUpBackground.dart';
import 'package:driver_app/components/signup/SignUpHeader.dart';
import 'package:driver_app/components/signup/ProfileImagePicker.dart';
// import 'package:driver_app/components/signup/SignUpTextField.dart';
import 'package:driver_app/components/signup/SignupButtonRow.dart';

import 'package:driver_app/components/signup/AddressSearchField.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  String _profilePicUrl = "assets/img/defaultdriverpic.jpg";
  File? _profileImage;

  String? _selectedAddress;
  double? _lat;
  double? _lng;

  final GooglePlacesService googlePlacesService= GooglePlacesService();

  final TextEditingController firstNameCtrl=TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController licenceCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();

  Future<void> pickAndCropImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );

    if (croppedFile != null) {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(croppedFile.path);

    final savedImage = await File(croppedFile.path).copy(
      '${appDir.path}/$fileName',
    );

    setState(() {
      _profileImage = savedImage;
      _profilePicUrl = savedImage.path; // ✅ IMPORTANT
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return SignUpBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const SignUpHeader(),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  40,
                  MediaQuery.of(context).size.height * 0.35,
                  40,
                  0,
                ),
                child: Column(
                  children: [

                    ProfileImagePicker(
                      imageFile: _profileImage,
                      onEdit: pickAndCropImage,
                    ),

                    const SizedBox(height: 20),

                    SignUpTextField(hint: "First Name", controller: firstNameCtrl),
                    const SizedBox(height: 15),

                    SignUpTextField(hint: "Last Name", controller: lastNameCtrl),
                    const SizedBox(height: 15),

                    SignUpTextField(hint: "Email", controller: emailCtrl),
                    const SizedBox(height: 15),

                    SignUpTextField(hint: "Phone", controller: phoneCtrl),
                    const SizedBox(height: 15),

                    SignUpTextField(
                      hint: "Password",
                      isPassword: true,
                      controller: passwordCtrl
                    ),
                    const SizedBox(height: 15),

                    // AddressSearchField(
                    //   controller: addressCtrl,
                    //   onSelected: (prediction) async{
                        
                    //     final details=await googlePlacesService.getPlacesDetails(prediction.placeId!);
                    //     if(details!=null){
                    //       final location=details['geometry']['location'];
                    //       // print("details : $details");
                    //       // print("place id : ${prediction.placeId}");
                    //       // print("location : $location");
                    //       // print("lat lng : $location['lat'] , $location['lng']");
                    //       // print("formatted address : $details['formatted_address']");

                    //       setState(() {
                    //         _selectedAddress=details['formatted_address'];
                    //         _lat=location['lat'];
                    //         _lng=location['lng'];

                    //         print("lat: $_lat");
                    //         print("lnt: $_lng");

                    //         addressCtrl.text=_selectedAddress!;
                    //         print("Selected address ::::::: $_selectedAddress");
                    //         //addressCtrl.value=_selectedAddress!;
                    //       });
                    //     }
                    //   },
                    // ),
                    // const SizedBox(height: 15),

                    SignUpTextField(hint: "Licence Number", controller: licenceCtrl),
                    const SizedBox(height: 15),

                    SignUpButtonRow(
                      onPressed: () {
                        
                        // if(_selectedAddress==null || _lat==null || _lng==null){
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text("Please Select a valid Address!"))
                        //   );
                        //   return;
                        // }
                        
                        // final address= Address(addressId: MockAddressData.addresses.length+1, streetLine1: _selectedAddress!, streetLine2: "", city: "", state: "", pincode: "", cordinate: LatLng(_lat!, _lng!));

                        // MockAddressData.addresses.add(address);

                        final driver= Driver(driverId: MockDriverData.drivers.length+1,firstName: firstNameCtrl.text, lastName: lastNameCtrl.text, email: emailCtrl.text, phone: phoneCtrl.text, password: passwordCtrl.text, licenceNumber: licenceCtrl.text);

                        MockDriverData.drivers.add(driver);
                        // print(MockDriverData.drivers.last.email);
                        // print(MockDriverData.drivers.last.address.streetLine1);
                        //MockDriverData.printTheLatestDriver();

                        final profilePic=ProfilePic(driverId: 1, picUrl: _profilePicUrl);
                        Navigator.pushNamed(context, "/login");
                      },
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}