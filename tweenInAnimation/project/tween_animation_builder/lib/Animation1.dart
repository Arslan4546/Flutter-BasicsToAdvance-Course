import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ManualWrapContainers(),
  ));
}

class ManualWrapContainers extends StatefulWidget {
  const ManualWrapContainers({super.key});

  @override
  State<ManualWrapContainers> createState() => _ManualWrapContainersState();
}

class _ManualWrapContainersState extends State<ManualWrapContainers> {
  Tween<Offset> myTweenValue =
      Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0));
  bool _isMoved = false;

  void translateContainer() {
    setState(() {
      // Toggle the state to either move or return to the original position
      _isMoved = !_isMoved;

      // Update the tween values based on the toggled state
      myTweenValue = Tween<Offset>(
          begin: Offset(0, 0), end: _isMoved ? Offset(0, 230) : Offset(0, 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 10, // Horizontal space between containers
                runSpacing: 10, // Vertical space between containers
                children: [
                  TweenAnimationBuilder(
                    tween: myTweenValue,
                    duration: const Duration(milliseconds: 900),
                    builder: (context, value, child) {
                      // translate is used to move the given child from the one offset to another offset
                      return Transform.translate(
                        offset: value,
                        child: child,
                      );
                    },
                    child: GestureDetector(
                        onTap: translateContainer,
                        child: ContainerBox(number: 1)),
                  ),
                  // )

                  ContainerBox(number: 2),
                  ContainerBox(number: 3),
                  ContainerBox(number: 4),
                  ContainerBox(number: 5),
                  ContainerBox(number: 6),
                  ContainerBox(number: 7),
                  ContainerBox(number: 8),
                  ContainerBox(number: 9),
                  ContainerBox(number: 10),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
          // Bottom container with only border and specific size
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 500,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white, // Border color
                  width: 2, // Border width
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      child: Text(
        "$number",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
