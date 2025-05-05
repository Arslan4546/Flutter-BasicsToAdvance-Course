import 'package:flutter/material.dart';
import 'package:navigation2_practice/myRouterDelegate.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  static const String routeName = '/first';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('This is the first page!'),
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
