import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FlipCardDemo()));
}

class FlipCardDemo extends StatefulWidget {
  const FlipCardDemo({super.key});

  @override
  State<FlipCardDemo> createState() => _FlipCardDemoState();
}

class _FlipCardDemoState extends State<FlipCardDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isFront = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animation =
        Tween<double>(begin: 0.0, end: math.pi).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _toggleCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3D Flip Card')),
      body: Center(
        child: GestureDetector(
          onTap: _toggleCard,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final isFlipped = _animation.value >= math.pi / 2;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // perspective
                  ..rotateY(_animation.value),
                child: isFlipped
                    ? _buildBack() // backside of card
                    : _buildFront(), // frontside
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFront() {
    return _card(color: Colors.blue, text: 'Front');
  }

  Widget _buildBack() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(math.pi),
      child: _card(color: Colors.red, text: 'Back'),
    );
  }

  Widget _card({required Color color, required String text}) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
