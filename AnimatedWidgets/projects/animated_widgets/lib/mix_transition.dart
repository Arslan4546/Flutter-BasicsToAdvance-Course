import 'package:flutter/material.dart';

class MixTransition extends AnimatedWidget {
  //const MixTransition({super.key, required super.listenable});
  const MixTransition(
      {super.key, required Animation<double> animm, required this.child})
      : super(listenable: animm);

  final Widget child;
  Animation<double> get animation => super.listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value,
      child: Transform.scale(
        scale: animation.drive(Tween<double>(begin: 1, end: 0.5)).value,
        child: Opacity(
          opacity: animation.drive(Tween<double>(begin: 1.0, end: 0.5)).value,
          child: child,
        ),
      ),
    );
  }
}
