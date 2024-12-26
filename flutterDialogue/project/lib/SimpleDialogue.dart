import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogBody extends StatelessWidget {
  const DialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      child: AlertDialog(
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
      ),
    );
  }
}
