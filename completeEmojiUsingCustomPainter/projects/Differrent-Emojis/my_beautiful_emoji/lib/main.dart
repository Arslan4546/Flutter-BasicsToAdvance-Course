import 'package:flutter/material.dart';
import 'package:my_beautiful_emoji/smily_painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomPaint(
            size: Size(200, 200), // Define the size of the Smily face
            painter: SmilyPainter(),
          ),
        ),
      ),
    );
  }
}
