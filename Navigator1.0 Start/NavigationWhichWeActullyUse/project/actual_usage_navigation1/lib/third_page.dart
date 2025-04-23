import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});
  static const String pageName = '/third_page';
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data, style: Theme.of(context).textTheme.headlineLarge),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('CAS is Best');
              },
              child: Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
