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
  int _counter = 0;
  bool isPrinter = false;
  bool isScanner = false;
  bool isMouse = false;
  bool isKeyboard = false;
  bool isHeadPhone = false;
  bool isSpeakers = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    tristate: true,
                    value: isPrinter,
                    onChanged: (value) {
                      setState(() {
                        isPrinter = value!;
                      });
                    },
                  ),
                  const Text('Printer'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isScanner,
                    onChanged: (value) {
                      setState(() {
                        isScanner = value!;
                      });
                    },
                  ),
                  const Text('Scanner'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isMouse,
                    onChanged: (value) {
                      setState(() {
                        isMouse = value!;
                      });
                    },
                  ),
                  const Text('Mouse'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isKeyboard,
                    onChanged: (value) {
                      setState(() {
                        isKeyboard = value!;
                      });
                    },
                  ),
                  const Text('Keyboard'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isHeadPhone,
                    onChanged: (value) {
                      setState(() {
                        isHeadPhone = value!;
                      });
                    },
                  ),
                  const Text('Head Phone'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isSpeakers,
                    onChanged: (value) {
                      setState(() {
                        isSpeakers = value!;
                      });
                    },
                  ),
                  const Text('Speaker'),
                ],
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
