import 'package:flutter/material.dart';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.moveTo(width * 0.5, 0); // Top-center
    path.lineTo(width, height * 0.25); // Top-right
    path.lineTo(width, height * 0.75); // Bottom-right
    path.lineTo(width * 0.5, height); // Bottom-center
    path.lineTo(0, height * 0.75); // Bottom-left
    path.lineTo(0, height * 0.25); // Top-left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
