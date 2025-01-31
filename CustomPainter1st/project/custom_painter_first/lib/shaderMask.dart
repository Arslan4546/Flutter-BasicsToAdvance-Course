import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.green,
            Colors.orange,
            Colors.red
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      blendMode:
          BlendMode.srcIn, // Ensures the gradient is applied inside the text
      child: const Text(
        "Hello this is Arslan",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Required for ShaderMask
        ),
      ),
    );
  }
}
