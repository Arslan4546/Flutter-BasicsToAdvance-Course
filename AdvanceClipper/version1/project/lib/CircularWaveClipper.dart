import 'package:flutter/material.dart';

class CircularWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // this path is used to start a path variable
    Path path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.25, size.width * 0.5,
        size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.75, size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
