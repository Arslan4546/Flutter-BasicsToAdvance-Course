import 'package:flutter/material.dart';

class MyCustomPainterAdvance extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:height, :width) = size;
    var center = Offset(width / 2, height / 2);
    var rect = Rect.fromCircle(center: center, radius: 100);
    var colors = [
      Colors.cyan,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.black
    ];

    Paint paint = Paint()
      ..color = Colors.brown
      ..shader = const LinearGradient(colors: [
        Colors.cyan,
        Colors.green,
        Colors.orange,
        Colors.red,
        Colors.black
      ], stops: [
        0.15,
        0.3,
        0.7,
        0.85,
        1.0
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)
          .createShader(rect)
      // ..shader = RadialGradient(
      //         colors: colors, radius: 0.7, center: Alignment.topCenter)
      //     .createShader(rect)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.color
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.square;

    //canvas.drawCircle(center, 100, paint);
    //canvas.drawLine(Offset(0,100), const Offset(100, 100), paint);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainterAdvance oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyCustomPainterAdvance oldDelegate) => false;
}
