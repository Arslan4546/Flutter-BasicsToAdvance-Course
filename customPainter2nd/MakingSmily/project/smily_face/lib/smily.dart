import 'dart:math';
import 'package:flutter/material.dart';

class SmilyPainter extends CustomPainter {
  final Color faceColor;
  final Color faceBorderColor;
  final Color eyesColor;

  SmilyPainter({
    this.faceColor = Colors.amber,
    this.faceBorderColor = Colors.black,
    this.eyesColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final double radius = min(width, height) / 2;
    final double eyesRadius = radius * 0.2;
    final double eyesHorizontalDeviation = radius * 0.4;
    final double eyesVerticalDeviation = radius * 0.6;

    final double eyesVerticalPosition = height / 2 - eyesVerticalDeviation;
    final double leftEyeHorizontalPosition =
        width / 2 - eyesHorizontalDeviation;
    final double rightEyeHorizontalPosition =
        width / 2 + eyesHorizontalDeviation;

    final Offset center = Offset(width / 2, height / 2);
    final Offset leftEyeOffset =
        Offset(leftEyeHorizontalPosition, eyesVerticalPosition);
    final Offset rightEyeOffset =
        Offset(rightEyeHorizontalPosition, eyesVerticalPosition);

    final Paint facePaint = Paint()..color = faceColor;
    final Paint faceBorderPaint = Paint()
      ..color = faceBorderColor
      ..style = PaintingStyle.stroke;
    final Paint eyesPaint = Paint()..color = eyesColor;

    // Draw Face
    canvas.drawCircle(center, radius, facePaint);

    // Draw Face Border
    canvas.drawCircle(center, radius, faceBorderPaint);

    // Draw Left Eye
    canvas.drawCircle(leftEyeOffset, eyesRadius, eyesPaint);

    // Draw Right Eye
    canvas.drawCircle(rightEyeOffset, eyesRadius, eyesPaint);
  }

  @override
  bool shouldRepaint(SmilyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SmilyPainter oldDelegate) => false;
}
