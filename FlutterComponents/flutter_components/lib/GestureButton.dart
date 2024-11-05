import 'package:flutter/material.dart';

class Gesturebutton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const Gesturebutton({super.key,required this.child,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(

      onTap: onPressed,
      child: child,
    );
  }
}
