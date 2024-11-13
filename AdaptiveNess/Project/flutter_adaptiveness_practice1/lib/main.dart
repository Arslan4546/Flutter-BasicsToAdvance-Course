import 'package:flutter/material.dart';
import 'package:flutter_adaptiveness/landscape.dart';
import 'package:flutter_adaptiveness/portrait.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Adaptiveness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter'),
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Size(:height, :width) = size;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Builder(
          builder: (context) => orientation == Orientation.portrait
              ? Portrait(height: height, width: width)
              : Landscape(height: height, width: width)),
    );
  }
}
