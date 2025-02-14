import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tween Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TweenAnimation(),
    );
  }
}

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  bool _isExpanded = false;
  Color _startColor = Colors.blue;
  Color _endColor = Colors.purple;
  final List<Color> _colors = [
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.green,
  ];
  int _colorIndex = 0;

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
      // Cycle through colors
      _colorIndex = (_colorIndex + 1) % _colors.length;
      _startColor = _colors[_colorIndex];
      _endColor = _colors[(_colorIndex + 1) % _colors.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Magical Tween Animation'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1200),
            tween: Tween<double>(
              begin: 0,
              end: _isExpanded ? 1.0 : 0.0,
            ),
            curve: Curves.elasticOut,
            builder: (context, double value, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(value * 2 * 3.14159)
                  ..rotateX(value * 3.14159 / 4),
                child: Container(
                  width: 200 + (value * 150),
                  height: 200 + (value * 150),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.lerp(_startColor, _endColor, value)!,
                        Color.lerp(_endColor, _startColor, value)!,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(value * 40),
                    boxShadow: [
                      BoxShadow(
                        color: _startColor.withOpacity(0.5),
                        blurRadius: 30 * value,
                        spreadRadius: 10 * value,
                      ),
                      BoxShadow(
                        color: _endColor.withOpacity(0.5),
                        blurRadius: 30 * value,
                        spreadRadius: 10 * value,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: value * 4 * 3.14159,
                          child: Icon(
                            Icons.star,
                            size: 80 + (value * 40),
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          'Magic!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32 + (value * 16),
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(5 * value, 5 * value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
