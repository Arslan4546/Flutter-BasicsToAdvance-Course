import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const TwoContainer());
}

class TwoContainer extends StatefulWidget {
  const TwoContainer({super.key});

  @override
  State<TwoContainer> createState() => _TwoContainerState();
}

class _TwoContainerState extends State<TwoContainer> {
  bool _isExpanded = false;

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  double scaleIn(double value) => 1.0 + value * 0.5;

  double angleIn(double value) => value * math.pi * 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: _toggleAnimation,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _isExpanded
                      ? [Colors.cyan, Colors.blue]
                      : [Colors.amber, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: _isExpanded ? 520 : 420,
              width: _isExpanded ? 300 : 200,
              child: Column(
                mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: TweenAnimationBuilder(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuad,
                      tween: Tween(begin: 0.0, end: _isExpanded ? 1.0 : 0.0),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: scaleIn(value),
                          child: Transform.rotate(
                            angle: angleIn(value),
                            child: CustomPaint(
                              size: Size(200,
                                  200), // specify the size of the custom paint
                              painter: InverseRightAngleTrianglePainter(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Click Me to Rotate & Scale",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: TweenAnimationBuilder(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuad,
                      tween: Tween(begin: 0.0, end: _isExpanded ? 1.0 : 0.0),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: scaleIn(value),
                          child: Transform.rotate(
                            angle: angleIn(value),
                            child: CustomPaint(
                              size: Size(200,
                                  200), // specify the size of the custom paint
                              painter: ReverseRightAngleTrianglePainter(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InverseRightAngleTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green // Triangle color
      ..style = PaintingStyle.fill; // Fill the triangle

    Path path = Path();
    path.moveTo(0, 0); // Top-left corner (Right angle)
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(0, size.height); // Bottom-left corner
    path.close(); // Complete the triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ReverseRightAngleTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red // Triangle color
      ..style = PaintingStyle.fill; // Fill the triangle

    Path path = Path();
    path.moveTo(size.width, size.height); // Bottom-right corner
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(0, size.height); // Bottom-left corner
    path.close(); // Complete the triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
