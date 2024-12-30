import 'package:flutter/material.dart';

class DoubleArchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.5);



    path.cubicTo(size.width * 0.25, size.height * 0.3, size.width * 0.25, size.height * 0.7, size.width * 0.5, size.height * 0.5);
    path.cubicTo(size.width * 0.75, size.height * 0.3, size.width * 0.75, size.height * 0.7, size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
