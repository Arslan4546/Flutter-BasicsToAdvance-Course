import 'package:flutter/material.dart';

class Inkwellbutton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const Inkwellbutton({super.key,required this.onPressed,required this.child});

  @override
  Widget build(BuildContext context) {



    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(20),

      child: InkWell(
        hoverColor: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child:child
      ),
    );
  }
}