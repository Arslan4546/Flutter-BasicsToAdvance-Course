import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var Size(:width, :height) = size;

    Path path = new Path();
    path.moveTo(width / 2, 0);
    path.lineTo(0, height);
    // path.lineTo(width, height);
    path.lineTo(width * 0.25, height * 0.5);
    path.lineTo(width, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
