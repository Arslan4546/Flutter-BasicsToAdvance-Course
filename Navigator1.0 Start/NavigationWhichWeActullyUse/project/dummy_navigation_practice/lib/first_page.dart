import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.data});
  static const String pageName = '/first_page';

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              data,
              style: Theme.of(context).primaryTextTheme.headlineLarge,
            ),
            ElevatedButton(
                onPressed: () {}, child: Text("Go to the previous page "))
          ],
        ),
      ),
    );
  }
}
