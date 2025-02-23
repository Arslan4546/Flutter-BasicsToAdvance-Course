import 'package:flutter/material.dart';
import 'package:staggered_animation/homeScreenComponents/lottie_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeButtonAnimation());
  }
}

class HomeButtonAnimation extends StatefulWidget {
  const HomeButtonAnimation({super.key});

  @override
  State<HomeButtonAnimation> createState() => _HomeButtonAnimationState();
}

class _HomeButtonAnimationState extends State<HomeButtonAnimation>
    with SingleTickerProviderStateMixin {
  // getting Screen height

// is Animation Start
  bool isAnim = false;

  // initialize Controller
  late AnimationController _controller;

// initializse different controller for different animations
  late Animation<double> _textFadeAnimation;
  late Animation<double> _scaleAnimation;
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

    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0, 0.10)),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.10, 0.20, curve: Curves.easeInOutBack)),
    );

    _widthAnimation = Tween<double>(begin: 0.0, end: double.infinity).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.20, 0.30)),
    );

    _heightAnimation = Tween<double>(begin: 0.0, end: 400).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.30, 0.40)),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.40, 1)),
    );
  }

  void _clickButtonAnimation() {
    if (_controller.isCompleted) {
    } else {
      isAnim = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieAnimation(
                assetPath: 'assets/lottie/getStartedLottie.json',
                height: isAnim ? size.height * 0.35 : size.height * 0.20,
              ),
              SizedBox(height: size.height * 0.08),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFFFD640),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
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
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: ElevatedButton(
                      onPressed: _clickButtonAnimation,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD640),
                        minimumSize: Size(size.width * 0.9, size.height * 0.07),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Opacity(
                        opacity: _textFadeAnimation.value,
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
