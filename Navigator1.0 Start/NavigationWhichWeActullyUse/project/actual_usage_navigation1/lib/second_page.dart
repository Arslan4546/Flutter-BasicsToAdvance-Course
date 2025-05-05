import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.data});
  final String data;
  static const String pageName = '/second_page';

  @override
  Widget build(BuildContext context) {
    List<String> myList = [
      "Arslan ",
      "Ali ",
      "Hassan ",
      "Tariq ",
      "Saqib ",
      "Awais ",
      "Usama ",
      "Ali ",
      "Hassan ",
      "Tariq ",
      "Saqib ",
      "Awais ",
      "Usama ",
      "Ali ",
      "Hassan ",
      "Tariq ",
      "Saqib ",
      "Awais ",
      "Usama "
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data, style: Theme.of(context).textTheme.headlineLarge),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(myList);
              },
              child: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
