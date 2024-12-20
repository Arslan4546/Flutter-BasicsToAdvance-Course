import 'package:flutter/material.dart';

class FormRadioButtons extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? groupValue;
  final Function(String?) onChanged;

  const FormRadioButtons({super.key,
    required this.label,
    required this.options,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Row(
          children: options
              .map(
                (option) => Row(
              children: [
                Radio<String>(
                  activeColor: Colors.blue,
                  value: option,
                  groupValue: groupValue,
                  onChanged: (value) => onChanged(value),
                ),
                Text(option),
              ],
            ),
          ).toList(),
        ),
      ],
    );
  }
}
