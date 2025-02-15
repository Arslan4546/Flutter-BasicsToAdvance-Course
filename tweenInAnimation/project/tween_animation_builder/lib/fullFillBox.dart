import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FullFillContainers(),
  ));
}

class FullFillContainers extends StatefulWidget {
  const FullFillContainers({super.key});

  @override
  State<FullFillContainers> createState() => _FullFillContainersState();
}

class _FullFillContainersState extends State<FullFillContainers> {
  bool _isMoved1 = false;
  bool _isMoved2 = false;
  bool _isMoved3 = false;
  bool _isMoved4 = false;
  bool _isMoved5 = false;

  double progressValue = 0.0; // 🔥 Progress bar value

  void updateProgress() {
    int movedCount = [_isMoved1, _isMoved2, _isMoved3, _isMoved4, _isMoved5]
        .where((moved) => moved) // Count only moved containers
        .length;

    setState(() {
      progressValue = movedCount / 5; // 5 containers → full progress
    });

    // 🎉 Snackbar when progress reaches 100%
    if (progressValue == 1.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "100% Completed",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  void toggleMove(int containerNumber) {
    setState(() {
      // Toggle each container's state
      if (containerNumber == 1) _isMoved1 = !_isMoved1;
      if (containerNumber == 2) _isMoved2 = !_isMoved2;
      if (containerNumber == 3) _isMoved3 = !_isMoved3;
      if (containerNumber == 4) _isMoved4 = !_isMoved4;
      if (containerNumber == 5) _isMoved5 = !_isMoved5;
    });

    updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tween Animation with Progress",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  AnimatedContainerBox(
                      number: 1,
                      isMoved: _isMoved1,
                      onTap: () => toggleMove(1)),
                  AnimatedContainerBox(
                      number: 2,
                      isMoved: _isMoved2,
                      onTap: () => toggleMove(2)),
                  AnimatedContainerBox(
                      number: 3,
                      isMoved: _isMoved3,
                      onTap: () => toggleMove(3)),
                  AnimatedContainerBox(
                      number: 4,
                      isMoved: _isMoved4,
                      onTap: () => toggleMove(4)),
                  AnimatedContainerBox(
                      number: 5,
                      isMoved: _isMoved5,
                      onTap: () => toggleMove(5)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),

          // 🔥 Progress Bar Container
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                // 🔲 Outer Border Container
                Container(
                  width: 500,
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),

                // 🔵 Progress Fill Container
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 400 * progressValue, // Fill according to progress
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent, // Progress color
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                // 🔢 Progress Text
                Positioned.fill(
                  child: Center(
                    child: Text(
                      "${(progressValue * 100).toInt()}%", // Show percentage
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🔄 Reusable Animated Container Widget
class AnimatedContainerBox extends StatelessWidget {
  final int number;
  final bool isMoved;
  final VoidCallback onTap;

  const AnimatedContainerBox({
    required this.number,
    required this.isMoved,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Pass function from parent
      child: TweenAnimationBuilder<Offset>(
        key: ValueKey(isMoved),
        tween: Tween<Offset>(
          begin: const Offset(0, 0),
          end: isMoved ? const Offset(0, 190) : const Offset(0, 0),
        ),
        duration: const Duration(milliseconds: 900),
        builder: (context, value, child) {
          return Transform.translate(
            offset: value,
            child: child,
          );
        },
        child: ContainerBox(number: number),
      ),
    );
  }
}

// 🔲 Normal Container Box
class ContainerBox extends StatelessWidget {
  final int number;
  const ContainerBox({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
