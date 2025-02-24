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
      home: const HomeButtonAnimation(),
    );
  }
}

class HomeButtonAnimation extends StatefulWidget {
  const HomeButtonAnimation({super.key});

  @override
  State<HomeButtonAnimation> createState() => _HomeButtonAnimationState();
}

class _HomeButtonAnimationState extends State<HomeButtonAnimation>
    with SingleTickerProviderStateMixin {
  // Is Animation Started
  bool isAnim = true;

  // Initialize Controller
  late AnimationController _controller;

  // Initialize different animations for different effects (non-MediaQuery dependent can stay in initState)
  late Animation<double> _textFadeAnimation;
  late Animation<double> _buttonWidthAnimation;
  late Animation<double> _containerWidthAnimation;
  late Animation<double> _containerHeightAnimation;

  // MediaQuery-dependent animations (initialize in didChangeDependencies)
  late Animation<double> _formPositionAnimation;
  late Animation<double> _formOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 3), // Extended duration for staggered animations
    )..addListener(() => setState(() {}));

    // Initialize non-MediaQuery dependent animations here
    _textFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.1, curve: Curves.easeInOut)),
    ); // 0s-0.3s: Fade out text

    _buttonWidthAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.1, 0.2, curve: Curves.easeInOut)),
    ); // 0.3s-0.6s: Shrink button width to 0

    _containerWidthAnimation =
        Tween<double>(begin: 0.0, end: double.infinity).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.3, curve: Curves.easeInOut)),
    ); // 0.6s-0.9s: Expand container width

    _containerHeightAnimation = Tween<double>(begin: 0.0, end: 560).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.3, 0.4, curve: Curves.easeInOut)),
    ); // 0.9s-1.2s: Increase container height
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize MediaQuery-dependent animations here
    final screenHeight = MediaQuery.of(context).size.height;

    _formPositionAnimation = TweenSequence<double>([
      // Phase 1: Move up slowly from bottom (screen height) to near final position (0)
      TweenSequenceItem(
        tween: Tween<double>(begin: screenHeight, end: 50).chain(
          CurveTween(curve: const Interval(0.4, 1.0, curve: Curves.easeInOut)),
        ),
        weight: 60, // 60% of the animation time for slow upward movement
      ),
      // Phase 2: Bounce effect at the end (final position)
      TweenSequenceItem(
        tween: Tween<double>(begin: 50, end: 0).chain(
          CurveTween(curve: const Interval(1.0, 1.3, curve: Curves.elasticOut)),
        ),
        weight: 40, // 40% of the animation time for bounce
      ),
    ]).animate(_controller);

    _formOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.2,
            curve: Curves.easeIn), // Delay and slow fade-in
      ),
    );
  }

  void _clickButtonAnimation() {
    if (_controller.isCompleted) {
      // Reset the animation to show the initial state again
      _controller
          .reverse(); // Reverse to fade text back in, expand button, shrink container, etc.
      isAnim = true;
    } else {
      _controller.forward(); // Forward to execute the sequence
      isAnim = false;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieAnimation(
              assetPath: 'assets/lottie/getStartedLottie.json',
              height: isAnim ? size.height * 0.35 : size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.08),
            Stack(
              alignment: Alignment.center, // Center the button and container
              children: [
                // Container with form fields, button, text, and icons (animates upward with bounce)
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          0,
                          _formPositionAnimation
                              .value), // Move upward with bounce
                      child: Opacity(
                        opacity: _formOpacityAnimation
                            .value, // Fade in after upward movement
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD640),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          width: _containerWidthAnimation.value,
                          height: _containerHeightAnimation.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Staggered animations for each form element
                              _buildStaggeredFormElement(
                                delay: 0.4, // Email field (first, 0.4s delay)
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Enter Email",
                                        suffixIcon:
                                            const Icon(Icons.email_outlined),
                                        labelStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700]),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 20),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFFFD740),
                                              width: 2),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              _buildStaggeredFormElement(
                                delay: 0.5, // Name field (second, 0.5s delay)
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Enter Your Name",
                                        suffixIcon:
                                            const Icon(Icons.person_outline),
                                        labelStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700]),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 20),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFFFD740),
                                              width: 2),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              _buildStaggeredFormElement(
                                delay:
                                    0.6, // Password field (third, 0.6s delay)
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Enter Password",
                                        suffixIcon: const Icon(Icons.password),
                                        labelStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700]),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 20),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFFFD740),
                                              width: 2),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              _buildStaggeredFormElement(
                                delay:
                                    0.7, // Sign Up button (fourth, 0.7s delay)
                                child: SizedBox(height: size.height * 0.02),
                              ),
                              _buildStaggeredFormElement(
                                delay:
                                    0.8, // Sign Up button (fourth, 0.8s delay)
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: Size(
                                        size.width * 0.95, size.height * 0.07),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: size.width * 0.048,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              _buildStaggeredFormElement(
                                delay: 0.9, // Bottom text (fifth, 0.9s delay)
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 150.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: RichText(
                                      text: const TextSpan(
                                        text: "Already Have An Account? ",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                        children: [
                                          TextSpan(
                                            text: "Sign In",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              _buildStaggeredFormElement(
                                delay: 1.0, // Bottom icons (sixth, 1.0s delay)
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 24,
                                      child: Icon(Icons.g_mobiledata,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 18),
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 24,
                                      child: Icon(Icons.apple,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 18),
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 24,
                                      child: Icon(Icons.facebook,
                                          color: Colors.white),
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
                // ElevatedButton with "Get Started" (fades out first, then shrinks)
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ScaleTransition(
                      scale: _buttonWidthAnimation, // Use for width scaling
                      child: ElevatedButton(
                        onPressed: _clickButtonAnimation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFD640),
                          minimumSize: Size(
                              size.width * 0.9 * _buttonWidthAnimation.value,
                              size.height * 0.07), // Scale width
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
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create staggered animations for form elements
  Widget _buildStaggeredFormElement(
      {required double delay, required Widget child}) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _controller.value;
        final start = delay;
        final end = delay + 0.3; // Each element animates over 0.3 seconds
        if (progress >= start && progress <= end) {
          final curveProgress =
              Curves.easeInOut.transform((progress - start) / (end - start));
          final offset =
              Tween<double>(begin: MediaQuery.of(context).size.height, end: 0)
                  .transform(curveProgress);
          return Transform.translate(
            offset: Offset(0, offset),
            child: Opacity(
              opacity: curveProgress, // Fade in as it moves
              child: child,
            ),
          );
        }
        return Opacity(
          opacity: progress > end ? 1.0 : 0.0, // Fully visible or hidden
          child: child,
        );
      },
    );
  }
}
