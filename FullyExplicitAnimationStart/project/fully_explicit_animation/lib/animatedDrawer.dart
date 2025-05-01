import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliding Drawer Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleDrawer() {
    setState(() {
      if (isDrawerOpen) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      isDrawerOpen = !isDrawerOpen;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double panelHeight = screenHeight * 0.3; // 60% of screen height

    return Scaffold(
      appBar: AppBar(title: const Text('Sliding Drawer Panel')),
      body: Stack(
        children: [
          // Main Content
          Center(
            child: ElevatedButton(
              onPressed: _toggleDrawer,
              child: Text(isDrawerOpen ? 'Close Drawer' : 'Open Drawer'),
            ),
          ),

          // Sliding Drawer Panel
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: 0,
                right: 0,
                bottom: -panelHeight + (_animation.value * panelHeight),
                height: panelHeight,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    // Detect swipe up & down
                    if (details.primaryDelta! < -10) {
                      _toggleDrawer(); // Swipe Up
                    } else if (details.primaryDelta! > 10) {
                      _toggleDrawer(); // Swipe Down
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
