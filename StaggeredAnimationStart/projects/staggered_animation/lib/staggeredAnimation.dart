import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedMenu extends StatefulWidget {
  const AnimatedMenu({super.key});

  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with SingleTickerProviderStateMixin {
  // initialize Controller
  late AnimationController _controller;

// initializse different controller for different animations
  late Animation<double> _rotationAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() => setState(() {}));

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.25)),
    );

    _widthAnimation = Tween<double>(begin: 0.0, end: 500).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.25, 0.50)),
    );

    _heightAnimation = Tween<double>(begin: 0.0, end: 700).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.50, 0.75)),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.75, 1.0)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          width: _widthAnimation.value,
          height: _heightAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Home'),
                Text('Schedule'),
                Text('School'),
                Text('Business'),
                Text('Person'),
              ],
            ),
          ),
        ),
        Transform.rotate(
          angle: _rotationAnimation.value,
          child: IconButton(
            onPressed: () {
              if (_controller.isCompleted) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            icon: const Icon(Icons.menu),
          ),
        ),
      ],
    );
  }
}
