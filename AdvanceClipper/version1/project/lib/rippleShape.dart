import 'package:flutter/material.dart';

class RippleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.5);
    for (double i = 0; i < size.width; i += size.width / 6) {
      path.quadraticBezierTo(i + size.width / 12, size.height * 0.4, i + size.width / 6, size.height * 0.5);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
