import 'package:flutter/material.dart';

class Portrait extends StatelessWidget {
  const Portrait({super.key, required this.height, required this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: height * 0.3,
            color: Colors.amber,
          ),
          SizedBox(
            height: height * 0.7,
            child: Row(
              children: [
                Container(
                  color: Colors.blue,
                  width: width * 0.3,
                ),
                Container(
                  color: Colors.greenAccent,
                  width: width * 0.4,
                ),
                Container(
                  color: Colors.orangeAccent,
                  width: width * 0.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
