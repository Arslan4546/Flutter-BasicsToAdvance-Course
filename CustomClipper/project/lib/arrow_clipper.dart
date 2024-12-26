import 'package:flutter/material.dart';

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0); // Tip of the arrow
    path.lineTo(size.width, size.height / 2); // Right point
    path.lineTo(size.width * 0.75, size.height / 2); // Inner right point
    path.lineTo(size.width * 0.75, size.height); // Bottom-right
    path.lineTo(size.width * 0.25, size.height); // Bottom-left
    path.lineTo(size.width * 0.25, size.height / 2); // Inner left point
    path.lineTo(0, size.height / 2); // Left point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
