import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String label;
  final String? errorText; // Nullable for dynamic error display
  final TextEditingController controller;
  final Function(String)? onChanged; // Callback for text changes

  const FormInputField({super.key,
    required this.label,
    this.errorText,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: height*0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
             cursorColor: Colors.blue,
            controller: controller,
            onChanged: onChanged,
            // Trigger the callback on text change
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
              errorText: errorText, // Dynamically display error message
            ),
          ),
        ],
      ),
    );
  }
}
