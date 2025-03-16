import 'package:flutter/material.dart';

class Floatingbutton extends StatefulWidget {
  const Floatingbutton({super.key});

  @override
  State<Floatingbutton> createState() => _FloatingbuttonState();
}

class _FloatingbuttonState extends State<Floatingbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: const Icon(
        Icons.message_outlined,
        color: Colors.white,
      ),
    );
  }
}
