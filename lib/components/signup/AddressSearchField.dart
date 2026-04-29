import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class AddressSearchField extends StatelessWidget {
  final Function(Prediction) onSelected;
  final TextEditingController controller;

  const AddressSearchField({
    super.key,
    required this.onSelected,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: controller,
      googleAPIKey: "AIzaSyA56YKW6VDfc0BBGdH80zxN2JY6R5nrgZk",

      inputDecoration: InputDecoration(
        hintText: "Search your address",
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      debounceTime: 400,
      countries: const ["in"],

      isLatLngRequired: false,

      itemClick: (Prediction prediction){

        controller.text = prediction.description ?? "";

        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );

        onSelected(prediction);
      },
    );
  }
}