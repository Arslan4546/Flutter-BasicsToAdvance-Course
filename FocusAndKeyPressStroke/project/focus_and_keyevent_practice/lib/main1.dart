import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  int _counter = 0;

  Color bgColor = Colors.white;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Focus(
        autofocus: true,
        onKeyEvent: (node, event) {
          print('Key Press: ${event.logicalKey}');
          if (event.logicalKey.keyId == LogicalKeyboardKey.keyP.keyId) {
            setState(() {
              bgColor = Colors.pink;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyB.keyId) {
            setState(() {
              bgColor = Colors.blue;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyO.keyId) {
            setState(() {
              bgColor = Colors.orange;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyA.keyId) {
            setState(() {
              bgColor = Colors.amber;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyG.keyId) {
            setState(() {
              bgColor = Colors.green;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyR.keyId) {
            setState(() {
              bgColor = Colors.red;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyI.keyId) {
            setState(() {
              bgColor = Colors.indigo;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyY.keyId) {
            setState(() {
              bgColor = Colors.yellow;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyC.keyId) {
            setState(() {
              bgColor = Colors.cyan;
            });
          } else if (event.logicalKey.keyId == LogicalKeyboardKey.keyT.keyId) {
            setState(() {
              bgColor = Colors.teal;
            });
          }
          return KeyEventResult.handled;
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
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
