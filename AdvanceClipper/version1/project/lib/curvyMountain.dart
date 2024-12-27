import 'package:flutter/material.dart';

class MountainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * 0.5, size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.8, size.height, size.width, size.height * 0.6);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
