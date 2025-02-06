import 'package:custom_clock/clockPainter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analogue Clock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Clock Practice'),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 200, // Width of the container
              height: 200, // Height of the container
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Makes the container round
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    blurRadius: 10, // How much the shadow blurs
                    offset: Offset(0, 4), // Position of the shadow
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade200,
                    Colors.purple.shade200,
                  ], // Gradient background
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKbEIVqy3sa9JXwxECCMOdCQV59T7Uaf5SIQ&s",
                  ),
                  fit: BoxFit.cover, // Fit the image within the circle
                ),
              ),
            ),
            CustomPaint(
              size: const Size(200, 200),
              painter: ClockPainter(),
            ),
          ],
        ),
      ),
    );
  }
}
