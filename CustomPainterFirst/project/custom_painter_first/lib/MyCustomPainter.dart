import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:height, :width) = size;
    //This is pattern matching, a concise way to extract height and width from size.
    var center = Offset(width / 2, height / 2);
// Offset represents a point in 2D space.
// This calculates the center of the given canvas area.
    Paint paint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round;
// color = Colors.brown: Sets the stroke color to brown.
// style = PaintingStyle.stroke: Specifies that only the stroke (outline) will be drawn, not a filled shape.
// strokeWidth = 25: Sets the stroke width to 25 pixels.
// strokeJoin = StrokeJoin.bevel: Defines how the corners of shapes will be joined.
// strokeCap = StrokeCap.square: Gives the stroke square-shaped end caps.

    //canvas.drawCircle(center, 100, paint);
    //canvas.drawLine(Offset.zero, const Offset(100, 100), paint);

// These lines are commented out but would draw:
// A circle centered at center with a radius of 100.
// A line from (0,0) to (100,0).

    canvas.drawRect(Rect.fromCircle(center: center, radius: 100), paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyCustomPainter oldDelegate) => false;
}
