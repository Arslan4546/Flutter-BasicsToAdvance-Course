import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FlipCardGrid(),
  ));
}

class FlipCardGrid extends StatefulWidget {
  const FlipCardGrid({super.key});

  @override
  State<FlipCardGrid> createState() => _FlipCardGridState();
}

class _FlipCardGridState extends State<FlipCardGrid> {
  int? _selectedCard;
  bool _isFlipped = false;

  void toggleCard(int index) {
    setState(() {
      if (_selectedCard == index) {
        _isFlipped = !_isFlipped;
        if (!_isFlipped) {
          _selectedCard = null;
        }
      } else {
        _selectedCard = index;
        _isFlipped = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Professional Flip Cards"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(4, (index) {
            bool isFlipped = _selectedCard == index && _isFlipped;
            return GestureDetector(
              onTap: () => toggleCard(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutCubicEmphasized,
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: isFlipped ? 3.14 : 0),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, double angle, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // Perspective effect
                        ..rotateY(angle), // Flip animation
                      child: angle > 1.5
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(
                                  3.14), // Fix text upside-down issue
                              child: _buildExpandedCard(index),
                            )
                          : _buildSmallCard(index),
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildSmallCard(int index) {
    List<String> titles = ["Leadership", "Innovation", "Teamwork", "Success"];
    return Center(
      child: Text(
        titles[index],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildExpandedCard(int index) {
    List<String> descriptions = [
      "Great leaders inspire and empower teams.",
      "Innovation drives creativity and progress.",
      "Teamwork leads to stronger outcomes.",
      "Success comes from persistence & hard work.",
    ];

    List<TextAlign> textAlignments = [
      TextAlign.left,
      TextAlign.right,
      TextAlign.center,
      TextAlign.justify
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        descriptions[index],
        textAlign: textAlignments[index],
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
