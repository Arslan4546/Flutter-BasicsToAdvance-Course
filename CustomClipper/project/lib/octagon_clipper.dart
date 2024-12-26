import 'package:flutter/material.dart';

class OctagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double factor = 0.3; // Factor to adjust corners

    path.moveTo(size.width * factor, 0); // Top-left
    path.lineTo(size.width * (1 - factor), 0); // Top-right
    path.lineTo(size.width, size.height * factor); // Right-top
    path.lineTo(size.width, size.height * (1 - factor)); // Right-bottom
    path.lineTo(size.width * (1 - factor), size.height); // Bottom-right
    path.lineTo(size.width * factor, size.height); // Bottom-left
    path.lineTo(0, size.height * (1 - factor)); // Left-bottom
    path.lineTo(0, size.height * factor); // Left-top
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
