import 'package:flutter/material.dart';
import 'package:navigation2_practice/myRouterDelegate.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.data});
  final String data;

  static const String routeName = '/first';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            MyRouterDelegate.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Text(
          data,
        ),
      ),
    );
  }
}
