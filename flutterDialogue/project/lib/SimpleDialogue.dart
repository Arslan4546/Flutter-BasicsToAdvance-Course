import 'package:flutter/material.dart';

class DialogBody extends StatelessWidget {
  const DialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding for better UI
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjust height to fit content
        children: [
          Row(
            children: const [
              Icon(Icons.delete, color: Colors.red),
              SizedBox(width: 10),
              Text('Do you want to delete this file?'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle 'Yes' button press
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('File Deleted')),
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}