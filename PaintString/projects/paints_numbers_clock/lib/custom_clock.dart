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

    // Paint for Clock Border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    // Paint for Center Dot
    final centerPaint = Paint()
      ..color = centerDotColor
      ..style = PaintingStyle.fill;

    // Draw Clock Border
    canvas.drawCircle(center, radius, borderPaint);

    // Draw Center Dot
    canvas.drawCircle(center, radius * 0.1, centerPaint);

    // Draw Hour and Minute Ticks
    _drawTicks(canvas, size, center, tickColor);

    // Draw Hour, Minute, and Second Hands
    _drawNeedles(canvas, size, center, secondHandColor);
  }

  void _drawTicks(Canvas canvas, Size size, Offset center, Color tickColor) {
    final radius = min(size.width, size.height) / 2;
    const angle = 2 * pi / 60;

    final hoursTickPaint = Paint()
      ..color = tickColor
      ..strokeWidth = 5.0;

    final minutesTickPaint = Paint()
      ..color = tickColor.withOpacity(0.6)
      ..strokeWidth = 3.0;

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

    // Draw numbers separately without rotation
    _drawClockNumbers(canvas, size, center, tickColor);
  }

  void _drawClockNumbers(
      Canvas canvas, Size size, Offset center, Color tickColor) {
    final radius = min(size.width, size.height) / 2;
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

    for (var i = 0; i < 12; i++) {
      final angle = (i * 30) *
          pi /
          180; // Convert degrees to radians (30 degrees per hour)
      final textRadius = radius - 25; // Adjust this value to position numbers

      // Calculate x and y positions using trigonometry
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

      // Center the text at the calculated position
      final offset = Offset(
        x - textPainter.width / 2,
        y - textPainter.height / 2,
      );

      textPainter.paint(canvas, offset);
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

    // Calculate angles for each hand
    final hourAngle = (2 * pi / 12) * (currentTime.hour % 12) +
        (2 * pi / 12 / 60) * currentTime.minute;
    final minuteAngle = (2 * pi / 60) * currentTime.minute +
        (2 * pi / 60 / 60) * currentTime.second;
    final secondAngle = (2 * pi / 60) * currentTime.second;

    // Draw hour, minute, and second hands
    _drawNeedle(canvas, center, radius * 0.5, hourAngle, hourPaint);
    _drawNeedle(canvas, center, radius * 0.6, minuteAngle, minutePaint);
    _drawNeedle(canvas, center, radius * 0.8, secondAngle, secondPaint);
  }

  void _drawNeedle(
      Canvas canvas, Offset center, double length, double angle, Paint paint) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle - pi / 2); // Rotate with adjustment for 0 position
    canvas.drawLine(Offset(0, 0), Offset(0, -length), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
