import 'package:flutter/material.dart';

void main() => runApp(MyTweenDemo());

class MyTweenDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TweenAnimationExample(),
    );
  }
}

class TweenAnimationExample extends StatefulWidget {
  @override
  _TweenAnimationExampleState createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Size> _sizeAnimation;
  late Animation<BorderRadius?> _borderRadiusAnimation;
  late Animation<Offset> _offsetAnimation;

  bool _toggled = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _sizeAnimation = Tween<Size>(
      begin: Size(100, 100),
      end: Size(200, 200),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _borderRadiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(0),
      end: BorderRadius.circular(50),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleAnimation() {
    setState(() {
      _toggled = !_toggled;
      _toggled ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tween Examples')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SlideTransition (Offset Tween)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _offsetAnimation.value,
                  child: Container(
                    width: _sizeAnimation.value.width,
                    height: _sizeAnimation.value.height,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          _borderRadiusAnimation.value ?? BorderRadius.zero,
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: Text(_toggled ? 'Reverse' : 'Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
