import 'package:flutter/material.dart';

class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    double centerX = width / 2;
    double centerY = height / 2;
    double radius = width / 2;

    for (int i = 0; i < 10; i++) {
      double angle = i * (3.141592653589793 * 2) / 10;
      double r = (i % 2 == 0) ? radius : radius / 2;
      path.lineTo(
        centerX + r * Math.cos(angle),
        centerY + r * Math.sin(angle),
      );
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


