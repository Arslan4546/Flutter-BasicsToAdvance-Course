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
    final innerEyeRadius = eyesRadius * 0.3;
    final double eyesHorizontalDeviation = radius * 0.4;
    final double eyesVerticalDeviation = radius * 0.1;
    final double eyeBrowHorizantal = radius * 0.2;
    final double eyeBrowVertical = radius * 0.4;
    final double smileDeviation = radius * 0.5;

    final double eyesVerticalPosition = height / 2 - eyesVerticalDeviation;

    final double leftEyeHorizontalPosition =
        width / 2 - eyesHorizontalDeviation;

    final double rightEyeHorizontalPosition =
        width / 2 + eyesHorizontalDeviation;

    final double leftEyeBrowHorizontalPosition = width / 2 - eyeBrowHorizantal;

    final double rightEyeBrowHorizontalPosition = width / 2 + eyeBrowHorizantal;

    final double eyesBrowVerticalPosition = height / 2 - eyeBrowVertical;
    final double innerEyesVerticalPosition = height / 2 - 5;
    final double smileVerticalPosition = height / 2 + smileDeviation;
    final double smileHorizantalPosition = radius;

    final Offset center = Offset(width / 2, height / 2);

    final Offset leftEyeOffset =
        Offset(leftEyeHorizontalPosition, eyesVerticalPosition);

    final Offset leftInnerEyeOffset =
        Offset(leftEyeHorizontalPosition, innerEyesVerticalPosition);

    final Offset rightInnerEyeOffset =
        Offset(rightEyeHorizontalPosition, innerEyesVerticalPosition);

    final Offset rightEyeOffset =
        Offset(rightEyeHorizontalPosition, eyesVerticalPosition);

    final Offset leftEyeBrowOffsetStart = Offset(
        leftEyeBrowHorizontalPosition - 40, eyesBrowVerticalPosition - 10);
    final Offset leftEyeBrowOffsetEnd =
        Offset(leftEyeBrowHorizontalPosition, eyesBrowVerticalPosition - 10);

    final Offset rightEyeBrowOffsetStart = Offset(
        rightEyeBrowHorizontalPosition + 40, eyesBrowVerticalPosition - 10);
    final Offset rightEyeBrowOffsetEnd =
        Offset(rightEyeBrowHorizontalPosition, eyesBrowVerticalPosition - 10);

    final Offset smileOffset =
        Offset(smileHorizantalPosition, smileVerticalPosition);

    final Paint facePaint = Paint()..color = faceColor;
    final Paint faceBorderPaint = Paint()
      ..color = faceBorderColor
      ..style = PaintingStyle.stroke;
    final Paint eyesPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5;
    final Paint innerEyesPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;

    // Draw Face
    canvas.drawCircle(center, radius, facePaint);

    // Draw Face Border
    canvas.drawCircle(center, radius, faceBorderPaint);

    // Draw Left Eye
    canvas.drawCircle(leftEyeOffset, eyesRadius, eyesPaint);

    // Draw Left InnerEye
    canvas.drawCircle(leftInnerEyeOffset, innerEyeRadius, innerEyesPaint);

    // Draw Right Eye
    canvas.drawCircle(rightEyeOffset, eyesRadius, eyesPaint);

    // Draw Right InnerEye
    canvas.drawCircle(rightInnerEyeOffset, innerEyeRadius, innerEyesPaint);

    // // Draw left Eye Brow
    // canvas.drawLine(
    //     leftEyeBrowOffsetStart, leftEyeBrowOffsetEnd, innerEyesPaint);
    // //Draw Right Eye Brow
    // canvas.drawLine(
    //     rightEyeBrowOffsetStart, rightEyeBrowOffsetEnd, innerEyesPaint);

    //Draw circle
    canvas.drawCircle(
        Offset(radius - 11, radius + 30), radius * 0.1, innerEyesPaint);
    canvas.drawCircle(
        Offset(radius + 11, radius + 30), radius * 0.1, innerEyesPaint);

    // Draw highty sad Impression
    // canvas.drawLine(Offset(radius - 1, radius + 20),
    //     Offset(radius + 30, radius + 40), innerEyesPaint);

    // canvas.drawLine(Offset(radius + 1, radius + 20),
    //     Offset(radius - 30, radius + 40), innerEyesPaint);

// // smile code
//     canvas.drawArc(
//         Rect.fromCenter(
//           center: Offset(radius, radius + 40),
//           width: 120,
//           height: 60,
//         ),
//         pi / 150,
//         pi,
//         true,
//         innerEyesPaint);

// // Draw the path of the nose of Emoji
//     Path nosePath = Path();
//     nosePath.moveTo(size.width / 2, size.height / 2 + 20);
//     nosePath.cubicTo(
//       size.width / 2 - 50,
//       size.height / 2 + 50,
//       size.width / 2,
//       size.height / 2,
//       size.width / 2,
//       size.height / 2,
//     );
    // canvas.drawPath(nosePath, innerEyesPaint);

    // Draw Left Ear
    // canvas.drawOval(
    //   Rect.fromCenter(
    //     center: Offset(width / 2 - radius, height / 2 - 60),
    //     width: radius / 2,
    //     height: radius / 3,
    //   ),
    //   facePaint,
    // );

    // // Draw Right Ear
    // canvas.drawOval(
    //   Rect.fromCenter(
    //     center: Offset(width / 2 + radius, height / 2 - 60),
    //     width: radius / 2,
    //     height: radius / 3,
    //   ),
    //   facePaint,
    // );
  }

  @override
  bool shouldRepaint(SmilyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SmilyPainter oldDelegate) => false;
}
