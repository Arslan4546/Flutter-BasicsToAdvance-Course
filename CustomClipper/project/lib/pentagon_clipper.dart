import 'package:flutter/material.dart';

class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0); // Top center
    path.lineTo(0, size.height * 0.4); // Top-left
    path.lineTo(size.width * 0.2, size.height); // Bottom-left
    path.lineTo(size.width * 0.8, size.height); // Bottom-right
    path.lineTo(size.width, size.height * 0.4); // Top-right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
