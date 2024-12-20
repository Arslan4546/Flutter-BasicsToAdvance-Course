import 'package:flutter/material.dart';

class FormPaymentSection extends StatelessWidget {
  const FormPaymentSection({super.key,required this.options});

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payment Method:', style: TextStyle(fontSize: 16)),
        Wrap(
          spacing: 8.0,
          children: options
              .map(
                (method) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(value: method, groupValue: null, onChanged: (value) {}),
                Text(method),
              ],
            ),
          ).toList(),
        ),
      ],
    );
  }
}
