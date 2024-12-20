import 'package:flutter/material.dart';

class FormRadioButtons extends StatelessWidget {
  final String label;
  final List<String> options;

  const FormRadioButtons({required this.label, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        Row(
          children: options
              .map(
                (option) => Row(
              children: [
                Radio(value: option, groupValue: null, onChanged: (value) {}),
                Text(option),
              ],
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}
