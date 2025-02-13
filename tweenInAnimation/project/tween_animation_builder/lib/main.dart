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

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
      // Swap colors for next animation
      final tempColor = _startColor;
      _startColor = _endColor;
      _endColor = tempColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Beautiful Tween Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 800),
            tween: Tween<double>(
              begin: 0,
              end: _isExpanded ? 1.0 : 0.0,
            ),
            curve: Curves.easeInOutBack,
            builder: (context, double value, child) {
              return Transform.scale(
                scale: 0.8 + (value * 0.2),
                child: Container(
                  width: 200 + (value * 100),
                  height: 200 + (value * 100),
                  decoration: BoxDecoration(
                    color: Color.lerp(_startColor, _endColor, value),
                    borderRadius: BorderRadius.circular(20 + (value * 20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: Offset(0, 10 * value),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Tap Me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24 + (value * 8),
                        fontWeight: FontWeight.bold,
                      ),
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
