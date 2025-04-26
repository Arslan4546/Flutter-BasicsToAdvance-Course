import 'package:flutter/material.dart';
import 'package:hero_and_listview_assignment/layouts/main_page.dart';
import 'package:hero_and_listview_assignment/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: MainPage.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
