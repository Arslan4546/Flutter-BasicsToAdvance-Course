import 'package:flutter/material.dart';

// fist page transityion
class FirstPageTransition extends PageRouteBuilder {
  FirstPageTransition({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: animation
                .drive(Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)),
            child: child,
          ),
          settings: settings,
        );
  final Widget page;
}

// second page transition

class SecondPageTransition extends PageRouteBuilder {
  SecondPageTransition({required this.page, super.settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: animation
                .drive(Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)),
            child: child,
          ),
        );
  final Widget page;
}
