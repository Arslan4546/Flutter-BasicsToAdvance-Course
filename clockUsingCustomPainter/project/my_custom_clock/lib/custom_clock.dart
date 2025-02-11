import 'dart:math';
import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime currentTime;
  final bool isDarkMode;

  ClockPainter({required this.currentTime, required this.isDarkMode});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Theme-based colors
    final Color borderColor = isDarkMode ? Colors.white70 : Colors.black;
    final Color tickColor = isDarkMode ? Colors.white : Colors.black;
    final Color secondHandColor = isDarkMode ? Colors.redAccent : Colors.red;
    final Color centerDotColor = isDarkMode ? Colors.white : Colors.black;
    // Update bell and stand colors to match second hand color
    final Color bellColor = isDarkMode ? Colors.redAccent : Colors.black;
    final Color standColor = isDarkMode ? Colors.redAccent : Colors.grey;

    final lineWidth = size.width * 0.06;

    // Draw bells and stands first
    _drawBellsAndStands(
        canvas, size, center, radius, bellColor, standColor, lineWidth);

    // Original clock drawing code
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final centerPaint = Paint()
      ..color = centerDotColor
      ..style = PaintingStyle.fill;

    // Draw Clock Border
    canvas.drawCircle(center, radius, borderPaint);

    // Draw Center Dot
    canvas.drawCircle(center, 5, centerPaint);

    // Draw Hour and Minute Ticks with Numbers
    _drawTicksAndNumbers(canvas, size, center, tickColor);

    // Draw Hour, Minute, and Second Hands
    _drawNeedles(canvas, size, center, secondHandColor);
  }

  void _drawBellsAndStands(Canvas canvas, Size size, Offset center,
      double radius, Color bellColor, Color standColor, double lineWidth) {
    // Stand measurements
    final startYDivation = radius * 0.80;
    final startXDivation = radius * 0.70;
    final endYDivation = radius * 0.60;
    final endXDivation = radius * 0.45;
    final double bellRadius = radius * 0.3;

    // Bell centers
    final leftBellCenter = Offset(size.width * 0.21, size.height - 215);
    final rightBellCenter = Offset(size.width * 0.79, size.height - 215);

    // Stand paint
    final standPaint = Paint()
      ..color = standColor
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    // Bell paint
    final bellPaint = Paint()
      ..color = bellColor
      ..style = PaintingStyle.fill;

    // Draw upper stands
    canvas.drawLine(
        Offset(center.dx - startXDivation, center.dy / 2 - startYDivation),
        Offset(center.dx - endXDivation, center.dy / 1.5 - endYDivation),
        standPaint);
    canvas.drawLine(
        Offset(center.dx + startXDivation, center.dy / 2 - startYDivation),
        Offset(center.dx + endXDivation, center.dy / 1.5 - endYDivation),
        standPaint);

    // Draw lower solid circles
    final circleRadius = radius * 0.23;
    final circleY = center.dy + radius * 1.1; // Position at clock's bottom
    final circleSpacing = radius * 1.2; // Space between circles

    // Left circle
    canvas.drawCircle(
        Offset(center.dx - circleSpacing / 2, circleY),
        circleRadius,
        Paint()
          ..color = standColor
          ..style = PaintingStyle.fill);

    // Right circle
    canvas.drawCircle(
        Offset(center.dx + circleSpacing / 2, circleY),
        circleRadius,
        Paint()
          ..color = standColor
          ..style = PaintingStyle.fill);

    // Draw bells
    canvas.drawArc(Rect.fromCircle(center: leftBellCenter, radius: bellRadius),
        pi, pi, false, bellPaint);
    canvas.drawArc(Rect.fromCircle(center: rightBellCenter, radius: bellRadius),
        pi, pi, false, bellPaint);
  }

  void _drawTicksAndNumbers(
      Canvas canvas, Size size, Offset center, Color tickColor) {
    final radius = min(size.width, size.height) / 2;
    const angle = 2 * pi / 60;

    final hoursTickPaint = Paint()
      ..color = tickColor
      ..strokeWidth = 5.0;

    final minutesTickPaint = Paint()
      ..color = tickColor.withOpacity(0.6)
      ..strokeWidth = 3.0;

    // Draw ticks
    canvas.save();
    canvas.translate(center.dx, center.dy);

    for (var i = 0; i < 60; i++) {
      bool isHourTick = i % 5 == 0;
      canvas.drawLine(
        Offset(0, -radius),
        Offset(0, -radius + (isHourTick ? 15 : 10)),
        isHourTick ? hoursTickPaint : minutesTickPaint,
      );
      canvas.rotate(angle);
    }

    canvas.restore();

    // Draw numbers
    const numbers = [
      "12",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11"
    ];
    final textRadius = radius - 25; // Adjust this value to position numbers

    for (var i = 0; i < 12; i++) {
      final angle = (i * 30) * pi / 180;
      final x = center.dx + textRadius * sin(angle);
      final y = center.dy - textRadius * cos(angle);

      final textSpan = TextSpan(
        text: numbers[i],
        style: TextStyle(
          color: tickColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }
  }

  void _drawNeedles(
      Canvas canvas, Size size, Offset center, Color secondHandColor) {
    final radius = min(size.width, size.height) / 2;

    final hourPaint = Paint()
      ..color = isDarkMode ? Colors.white70 : Colors.black
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final minutePaint = Paint()
      ..color = isDarkMode ? Colors.white70 : Colors.black
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    final secondPaint = Paint()
      ..color = secondHandColor
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final hourAngle = (2 * pi / 12) * (currentTime.hour % 12) +
        (2 * pi / 12 / 60) * currentTime.minute;
    final minuteAngle = (2 * pi / 60) * currentTime.minute +
        (2 * pi / 60 / 60) * currentTime.second;
    final secondAngle = (2 * pi / 60) * currentTime.second;

    _drawNeedle(canvas, center, radius * 0.5, hourAngle, hourPaint);
    _drawNeedle(canvas, center, radius * 0.6, minuteAngle, minutePaint);
    _drawNeedle(canvas, center, radius * 0.8, secondAngle, secondPaint);
  }

  void _drawNeedle(
      Canvas canvas, Offset center, double length, double angle, Paint paint) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle - pi / 2);
    canvas.drawLine(Offset(0, 0), Offset(0, -length), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
