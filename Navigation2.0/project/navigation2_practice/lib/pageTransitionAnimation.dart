import 'package:flutter/material.dart';

class PageTransitionAnimation extends Page {
  final Widget page;

  const PageTransitionAnimation({
    required this.page,
    required String super.name,
    super.arguments,
    super.key,
  });

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ),
          ),
          child: RotationTransition(
              turns: animation.drive(
                Tween(
                  begin: 0,
                  end: 1,
                ),
              ),
              child: child),
        );
      },
    );
  }
}
