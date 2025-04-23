import 'package:flutter/material.dart';

class LeftSlidePageTransition extends PageRouteBuilder {
  LeftSlidePageTransition({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: animation.drive(
              Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero),
            ),
            child: child,
          ),
          settings: settings,
        );

  final Widget page;
}
