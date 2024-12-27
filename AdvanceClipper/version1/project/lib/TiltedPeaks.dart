import 'package:flutter/material.dart';

class TiltedPeaksClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(size.width * 0.2, size.height * 0.6, size.width * 0.4, size.height, size.width * 0.5, size.height * 0.6);
    path.cubicTo(size.width * 0.6, size.height * 0.3, size.width * 0.8, size.height, size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
