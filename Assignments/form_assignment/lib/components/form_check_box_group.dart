import 'package:flutter/material.dart';

class FormCheckBoxGroup extends StatelessWidget {
  final String label;
  final List<String> options;
  final List<bool> values;
  final Function(int, bool) onChanged;

  const FormCheckBoxGroup({super.key,
    required this.label,
    required this.options,
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Wrap(
          spacing: 8.0,
          children: List.generate(
            options.length,
                (index) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                activeColor: Colors.blue,
                  value: values[index],
                  onChanged: (checked) => onChanged(index, checked!),
                ),
                Text(options[index]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
