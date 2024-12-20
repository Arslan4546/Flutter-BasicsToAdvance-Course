import 'package:flutter/material.dart';

class FormCheckBoxGroup extends StatelessWidget {
  final String label;
  final List<String> options;

  const FormCheckBoxGroup({required this.label, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        Wrap(
          spacing: 8.0,
          children: options
              .map(
                (option) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(value: false, onChanged: (value) {}),
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
