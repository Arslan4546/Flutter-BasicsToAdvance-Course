import 'package:flutter/material.dart';
import 'smily_painter.dart';

class Smily extends StatelessWidget {
  const Smily({
    super.key,
    required this.size,
    this.faceColor = Colors.amber,
    this.faceBorderColor = Colors.black,
    this.eyesColor = Colors.black,
    this.mouthColor = Colors.black,
  });

  final Size size;
  final Color faceColor;
  final Color faceBorderColor;
  final Color eyesColor;
  final Color mouthColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SmilyPainter(
        eyesColor: eyesColor,
        faceColor: faceColor,
        faceBorderColor: faceBorderColor,
        mouthColor: mouthColor,
      ),
      size: size,
    );
  }
}
