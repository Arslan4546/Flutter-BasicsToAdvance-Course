import 'package:flutter/material.dart';
import 'package:navigation2_practice/myRouterDelegate.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  static const String routeName = '/second';
  @override
  Widget build(BuildContext context) {
    List<String> args =
        ModalRoute.of(context)?.settings.arguments as List<String>;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              MyRouterDelegate.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) => Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Center(
                child: Text(args[index]),
              ),
            ),
            itemCount: args.length,
          ),
        ));
  }
}
