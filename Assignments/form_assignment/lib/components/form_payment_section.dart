import 'package:flutter/material.dart';

class FormPaymentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payment Method:', style: TextStyle(fontSize: 16)),
        Wrap(
          spacing: 8.0,
          children: ['Credit Card', 'Debit Card', 'Cash', 'Check']
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
