import 'dart:async';

import 'package:complete_emoji/smily.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smiy Emoji',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Smily Emoji'),
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
  static const maxExtent = 400.0;
  static const minExtent = 50.0;
  static const stepExtent = 20;

  double extent = maxExtent;
  Color faceColor = Colors.amber;
  double t = 0.0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        if (t < 1.0) {
          t += 0.1;
        } else {
          t = 0.0;
        }
        faceColor = Color.lerp(Colors.amber, Colors.red, t)!;
        if (extent < maxExtent) {
          extent += stepExtent;
        } else {
          extent = minExtent;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Smily(
          size: Size(extent, extent),
          faceColor: faceColor,
        ),
      ),
    );
  }
}
