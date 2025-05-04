import 'package:flutter/material.dart';

class CircleRectTween extends RectTween {
  CircleRectTween({required Rect begin, required Rect end})
      : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final adjustedT = Curves.easeInOutQuart.transform(t);

    final beginCenter = begin!.bottomRight;

    final maxRadius =
        end!.width > end!.height ? end!.width * 1.5 : end!.height * 1.5;

    final buttonRadius = begin!.width / 2;

    final radius = buttonRadius + (maxRadius - buttonRadius) * adjustedT;

    return Rect.fromCircle(
      center: beginCenter,
      radius: radius,
    );
  }
}
