import 'package:flutter/material.dart';

class DialogBody extends StatelessWidget {
  const DialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Confirmation"),
      content: Row(
        children: const [
          Icon(Icons.delete),
          SizedBox(width: 10),
          Text('Do you want to delete this file?'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Handle 'Yes' button press
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
