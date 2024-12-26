import 'package:flutter/material.dart';

class CrescentClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.addOval(Rect.fromCircle(center: Offset(width / 2, height / 2), radius: width / 2));
    path.addOval(Rect.fromCircle(center: Offset(width / 3, height / 2), radius: width / 3));
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
