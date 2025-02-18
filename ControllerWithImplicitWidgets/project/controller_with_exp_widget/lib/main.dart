import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Fan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AnimatedFanPage(),
    );
  }
}

class AnimatedFanPage extends StatefulWidget {
  const AnimatedFanPage({super.key});

  @override
  State<AnimatedFanPage> createState() => _AnimatedFanPageState();
}

class _AnimatedFanPageState extends State<AnimatedFanPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isRotating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Fan speed
    )..repeat(); // Fan starts rotating by default
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleRotation() {
    setState(() {
      isRotating = !isRotating;
      if (isRotating) {
        _controller.repeat(); // Start rotating
      } else {
        _controller.stop(); // Stop rotating
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: child,
            );
          },
          child: CustomPaint(
            size: const Size(200, 200),
            painter: FanPainter(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleRotation,
        tooltip: isRotating ? 'Stop Fan' : 'Start Fan',
        child: Icon(isRotating ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

class FanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.blueAccent;
    final double bladeWidth = size.width / 3;
    final double bladeHeight = size.height / 1.5;
    final Offset center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 3; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate((i * 2 * pi) / 3);
      canvas.drawPath(
        Path()
          ..moveTo(0, 0)
          ..lineTo(-bladeWidth / 2, -bladeHeight)
          ..lineTo(bladeWidth / 2, -bladeHeight)
          ..close(),
        paint,
      );
      canvas.restore();
    }

    // Draw center circle
    final Paint centerPaint = Paint()..color = Colors.black;
    canvas.drawCircle(center, size.width * 0.1, centerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
