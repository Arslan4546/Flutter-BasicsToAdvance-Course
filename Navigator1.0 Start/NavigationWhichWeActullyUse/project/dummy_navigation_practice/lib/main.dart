import 'package:dummy_navigation_practice/first_page.dart';
import 'package:dummy_navigation_practice/myNavigations.dart';
import 'package:dummy_navigation_practice/second_Page.dart';
import 'package:flutter/material.dart';

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
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: Mynavigations.onGenerateRoute,
      initialRoute: MyHomePage.pageName,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  static const String pageName = '/';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var data = " By-default data on the main page";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data,
              )
            ],
          ),
        ),
        floatingActionButton: OverflowBar(
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.back_hand),
            ),
           const  SizedBox(
              width: 30,
            ),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Increment',
              child: const  Icon(Icons.front_hand),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void _incrementCounter() async {
    var resultOfFirstPage = await Navigator.of(context).pushNamed(
        FirstPage.pageName,
        arguments: "Text from main page to first page");
    setState(() {
      data = resultOfFirstPage as String;
    });
  }

  void _decrementCounter() async {
    var resultOfSecondPage = await Navigator.of(context).pushNamed(
        SecondPage.pageName,
        arguments: "Text form main page to second page");

    setState(() {
      data = resultOfSecondPage as String;
    });
  }
}
