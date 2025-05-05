// ignore_for_file: use_build_context_synchronously

import 'package:actual_usage_navigation1/navigation_Page.dart';
import 'package:actual_usage_navigation1/second_page.dart';
import 'package:actual_usage_navigation1/third_page.dart';
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
      ),
      // routes:
      // {
      //   MyHomePage.pageName: (context) => MyHomePage(title: 'Home Page'),
      //   SecondPage.pageName: (context) => SecondPage(data: 'Pakistan Zindabad'),
      //   ThirdPage.pageName: (context) => ThirdPage(),
      // },
      onGenerateRoute: onGenerateRoute,
      initialRoute: MyHomePage.pageName,
      //onGenerateRoute: MyNavigation.onGenerateRoute,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
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

class _MyHomePageState extends State<MyHomePage> {
  String data = 'You have pushed the button this many times:';
  List<String> yourList = ["Arslan", "Ali", "Hassan", "Tariq", "Saqib"];
  void _incrementCounter() async {
    List<String> myList = await Navigator.of(context).pushNamed(
      SecondPage.pageName,
      arguments: yourList,
    ) as List<String>;
    setState(() {
      yourList = myList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(data),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: Center(
                child: Text(
              yourList[index],
              style: TextStyle(color: Colors.white),
            )),
          ),
          itemCount: yourList.length,
        ),
      ),
      floatingActionButton: OverflowBar(
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            heroTag: 'inc',
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            heroTag: 'dec',
            tooltip: 'Decrement',
            child: const Icon(Icons.bubble_chart),
          ),
        ],
      ),
    );
  }

  void _decrementCounter() async {
    // var result = await Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => ThirdPage(),
    //     settings: RouteSettings(arguments: 'Pakistan Zindabad'),
    //   ),
    // );

    var result = await Navigator.of(
      context,
    ).pushNamed(ThirdPage.pageName, arguments: 'CAS is the Best') as String;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
    setState(() {
      data = result;
    });
  }
}
