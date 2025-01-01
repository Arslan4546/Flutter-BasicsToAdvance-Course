import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  final double endAngle;
  MyCustomClipper({required this.endAngle});

  @override
  Path getClip(Size size) {
    var Size(:width, :height) = size;

    Path path = Path();
    // path.lineTo(width * 0.25, 0);
    // path.quadraticBezierTo(width * 0.5, height * 0.5, width * 0.75, 0);
    // path.cubicTo(
    //   width * 0.37, height * 0.5, width * 0.625, height * 0.625, height, 0);
    // path.conicTo(width * 0.5, height * 0.5, width * 0.75, 0, 4);
    // path.lineTo(width, 0);
    // path.lineTo(width, height);
    // path.lineTo(0, height);
    // path.arcTo(
    //   Rect.fromLTWH(0, 0, width, height), degToRad(0), degToRad(endAngle),
    //   false);

    // final points = [
    //   Offset(width / 2, 0),
    //   // Offset(width / 2, height),
    //   // Offset(width * 0.15, height / 2),
    //   Offset(width * 0.85, height / 2),
    //   Offset(width, height)
    // ];

    path.addRect(Rect.fromLTWH(0, 0, width / 2, height / 2));
    path.addOval(Rect.fromLTWH(width / 2, height / 2, width, height));
    // path.addPolygon(points, true);
    path.close();
    return path;
  }

  double degToRad(double deg) => deg * pi / 180;

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>
      (oldClipper as MyCustomClipper).endAngle != endAngle;
}
