import 'package:flutter/material.dart';
import 'package:navigation2_practice/first_page.dart';
import 'package:navigation2_practice/myRouteInformationParser.dart';
import 'package:navigation2_practice/myRouterDelegate.dart';
import 'package:navigation2_practice/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: MyrouteInformationParser(),
      routerDelegate: MyRouterDelegate(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String routeName = '/main';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the main page!'),
            ElevatedButton(
              onPressed: () {
                MyRouterDelegate.of(context)
                    .push(const RouteSettings(name: FirstPage.routeName));
              },
              child: const Text('Go to First Page'),
            ),
            ElevatedButton(
              onPressed: () {
                MyRouterDelegate.of(context)
                    .push(const RouteSettings(name: SecondPage.routeName));
              },
              child: const Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
