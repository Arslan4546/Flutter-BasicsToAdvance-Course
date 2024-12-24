import 'package:flutter/material.dart';

class MainDialogue extends StatelessWidget {
  const MainDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'User Name'),
              keyboardType: TextInputType.text,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              keyboardType: TextInputType.text,
            ),
            OverflowBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successfully')),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Canceled')),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
