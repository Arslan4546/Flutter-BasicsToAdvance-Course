import 'package:flutter/material.dart';

class MustacheEmojiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    // Draw Face (Yellow Circle)
    paint.color = Colors.yellow;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Draw Eyes (Black Ovals)
    paint.color = Colors.black;
    double eyeWidth = size.width * 0.1;
    double eyeHeight = size.height * 0.15;
    double eyeY = size.height * 0.35;
    double eyeXOffset = size.width * 0.2;

    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(size.width / 2 - eyeXOffset, eyeY),
          width: eyeWidth,
          height: eyeHeight),
      paint,
    );
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(size.width / 2 + eyeXOffset, eyeY),
          width: eyeWidth,
          height: eyeHeight),
      paint,
    );

    // Draw Mustache
    paint.color = Colors.black;

    Path mustachePath = Path();
    double centerX = size.width / 2;
    double mustacheY = size.height * 0.6;
    double mustacheWidth = size.width * 0.6;
    double mustacheHeight = size.height * 0.15;

    // Left Side of Mustache
    mustachePath.moveTo(centerX, mustacheY);
    mustachePath.cubicTo(
      centerX - mustacheWidth * 0.4, mustacheY - mustacheHeight, // Control 1
      centerX - mustacheWidth * 0.6, mustacheY + mustacheHeight, // Control 2
      centerX - mustacheWidth * 0.3, mustacheY, // End
    );
    mustachePath.cubicTo(
      centerX - mustacheWidth * 0.1,
      mustacheY + mustacheHeight * 0.8, // Control 1
      centerX - mustacheWidth * 0.2,
      mustacheY - mustacheHeight * 0.3, // Control 2
      centerX, mustacheY, // End
    );

    // Right Side of Mustache (Mirroring the Left Side)
    mustachePath.cubicTo(
      centerX + mustacheWidth * 0.2,
      mustacheY - mustacheHeight * 0.3, // Control 1
      centerX + mustacheWidth * 0.1,
      mustacheY + mustacheHeight * 0.8, // Control 2
      centerX + mustacheWidth * 0.3, mustacheY, // End
    );
    mustachePath.cubicTo(
      centerX + mustacheWidth * 0.6, mustacheY + mustacheHeight, // Control 1
      centerX + mustacheWidth * 0.4, mustacheY - mustacheHeight, // Control 2
      centerX, mustacheY, // End
    );

    mustachePath.close();
    canvas.drawPath(mustachePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
