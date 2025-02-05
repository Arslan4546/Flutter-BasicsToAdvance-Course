import 'dart:math';

import 'package:flutter/material.dart';

class SmilyPainter extends CustomPainter {
  Color faceColor;
  Color faceBorderColor;
  Color eyesColor;
  Color mouthColor;

  SmilyPainter({
    this.faceColor = Colors.amber,
    this.faceBorderColor = Colors.black,
    this.eyesColor = Colors.black,
    this.mouthColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Size(:height, :width) = size;
    final radius = min(width, height) / 2;
    final mouthRadius = radius * 0.4;
    final eyesRadius = radius * 0.2;
    final mouthDistanceFromCenter = radius * 0.2;
    final eyesHorizontalDeviation = radius * 0.4;
    final eyesVerticalDeviation = radius * 0.4;
    final eyesVerticalPosition = height / 2 - eyesVerticalDeviation;
    final leftEyeHorizontalPosition = width / 2 - eyesHorizontalDeviation;
    final rightEyeHorizontalPosition = width / 2 + eyesHorizontalDeviation;

    final center = Offset(width / 2, height / 2);
    final leftEyeOffset =
        Offset(leftEyeHorizontalPosition, eyesVerticalPosition);
    final rightEyeOffset =
        Offset(rightEyeHorizontalPosition, eyesVerticalPosition);
    final mouthOffset = Offset(center.dx, center.dy + mouthDistanceFromCenter);

    final facePaint = Paint()..color = faceColor;
    final mouthPaint = Paint()..color = mouthColor;
    final faceBorderPaint = Paint()
      ..color = faceBorderColor
      ..style = PaintingStyle.stroke;
    final eyesPaint = Paint()..color = eyesColor;

    // Draw Face
    canvas.drawCircle(center, radius, facePaint);
    // Draw Face Border
    canvas.drawCircle(center, radius, faceBorderPaint);

    // Draw Left Eye
    canvas.drawCircle(leftEyeOffset, eyesRadius, eyesPaint);
    // Draw Right Eye
    canvas.drawCircle(rightEyeOffset, eyesRadius, eyesPaint);

    // Draw Mouth
    canvas.drawArc(
      Rect.fromCircle(center: mouthOffset, radius: mouthRadius),
      degToRadian(0),
      degToRadian(180),
      true,
      mouthPaint,
    );
  }

  double degToRadian(double deg) => deg * pi / 180;

  @override
  bool shouldRepaint(SmilyPainter oldDelegate) => isRepaint(oldDelegate);

  @override
  bool shouldRebuildSemantics(SmilyPainter oldDelegate) =>
      isRepaint(oldDelegate);

  bool isRepaint(SmilyPainter oldDelegate) {
    return oldDelegate.eyesColor != eyesColor ||
        oldDelegate.faceColor != faceColor ||
        oldDelegate.mouthColor != mouthColor ||
        oldDelegate.faceBorderColor != faceBorderColor;
  }
}
