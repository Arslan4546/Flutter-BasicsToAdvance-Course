import 'dart:async';

import 'package:add_methods_in_clipper/customClipper.dart';
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
      home: const MyHomePage(title: 'Flutter clipper Practice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const src =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU7cRrC1jRRx-eaEko7_KUodWQdJWdjIhTLQ&s';
  double endAngle = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 200),
      (timer) {
        setState(() {
          if (endAngle < 360) {
            endAngle += 10;
          } else {
            endAngle = 0;
          }
        });
      },
    );
  }

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
            // ClipRRect(borderRadius: BorderRadius.circular(30),child:
            // Image.asset(src,height: 300,width: 400,fit: BoxFit.fill,)),
            // ClipOval(child: Image.asset(src,height: 300,width: 400,fit:
            // BoxFit.fill,)),
            ClipPath(
              clipper: MyCustomClipper(endAngle: endAngle),
              child: Image.network(
                src,
                height: 300,
                width: 400,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
