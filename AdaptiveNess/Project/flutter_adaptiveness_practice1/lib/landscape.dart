import 'package:flutter/material.dart';

class Landscape extends StatelessWidget {
  const Landscape({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            width: width * 0.3,
            color: Colors.amber,
          ),
          SizedBox(
            width: width * 0.7,
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  height: height * 0.3,
                ),
                Container(
                  color: Colors.greenAccent,
                  height: height * 0.4,
                ),
                Container(
                  color: Colors.orangeAccent,
                  height:height * 0.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
