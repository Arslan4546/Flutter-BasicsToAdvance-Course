import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  static const String pageName = '/second_page';
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              data,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop("This is the text from the second page");
                },
                child: Text("Go to the previous page "))
          ],
        ),
      ),
    );
  }
}
