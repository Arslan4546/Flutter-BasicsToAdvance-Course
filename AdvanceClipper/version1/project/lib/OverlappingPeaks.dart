import 'package:flutter/material.dart';

class PeaksClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);

    // First peak
    path.conicTo(
      size.width * 0.2, size.height * 0.1,
      size.width * 0.4, size.height,
      0.9,
    );

    // Second peak
    path.conicTo(
      size.width * 0.6, size.height * 0.1,
      size.width * 0.8, size.height,
      0.9,
    );

    // Close path
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
