import 'package:flutter/material.dart';
import 'package:navigation2_practice/myRouterDelegate.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  static const String routeName = '/second';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('This is the Second page!'),
            ElevatedButton(
              onPressed: () {
                MyRouterDelegate.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
