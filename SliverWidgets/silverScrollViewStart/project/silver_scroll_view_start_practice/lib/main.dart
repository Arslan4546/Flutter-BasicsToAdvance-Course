import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Scroll View Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Custom Scroll View Practice'),
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
  int _counter = 0;
  Random random = Random();
  static const max = 255;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = List.generate(
      100,
      (index) => '$index',
    );

    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Sliver Effects'),
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJbIcFzHNj_6KTbhToV6Bg2E3BX8ciLNnaSw&s'),
              ),
            ),
            SliverGrid.builder(
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (context, index) => Container(
                width: 50,
                height: 50,
                color: Color.fromARGB(
                  random.nextInt(max),
                  random.nextInt(max),
                  random.nextInt(max),
                  random.nextInt(max),
                ),
                child: Center(
                  child: Text(list[index]),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => Container(
                width: 50,
                color: Color.fromARGB(
                  random.nextInt(max),
                  random.nextInt(max),
                  random.nextInt(max),
                  random.nextInt(max),
                ),
                child: Center(
                  child: Text(list[index]),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
