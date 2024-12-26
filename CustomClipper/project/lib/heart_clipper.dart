import 'package:flutter/material.dart';

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.moveTo(width / 2, height * 0.75); // Bottom point
    path.quadraticBezierTo(0, height / 2, width / 4, height / 4); // Left curve
    path.arcToPoint(
      Offset(width / 2, height / 4),
      radius: Radius.circular(width / 4),
      clockwise: false,
    );
    path.arcToPoint(
      Offset(width * 3 / 4, height / 4),
      radius: Radius.circular(width / 4),
      clockwise: false,
    );
    path.quadraticBezierTo(width, height / 2, width / 2, height * 0.75); // Right curve
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
