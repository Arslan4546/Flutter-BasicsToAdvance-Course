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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  double top = 0;
  double left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              top: top,
              left: left,
              duration: const Duration(milliseconds: 200),
              child: const Icon(
                Icons.donut_large,
                size: 100,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: OverflowBar(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                left += 10;
              });
            },
            icon: const Icon(Icons.arrow_right, size: 50),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                left -= 10;
              });
            },
            icon: const Icon(Icons.arrow_left, size: 50),
          ),
          IconButton(
            onPressed: () {
              for (var i = 0; i < 20; i++) {
                setState(() {
                  left += 10;
                });
              }
            },
            icon: const Icon(Icons.arrow_right, size: 50),
          ),
        ],
      ),
    );
  }
}
