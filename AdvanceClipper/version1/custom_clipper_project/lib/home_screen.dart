import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/bottom_container.dart';
import 'components/top_contianer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Stack(
        children: [
          // Top clipped container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: const Color(0xff5AE4A8)
              ),
            ),
          ),
          // Bottom clipped container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: BottomClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: const Color(0xff5AE4A8)
              ),
            ),
          ),
          // Main content in the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Image.asset(
                  'assets/images/img.jpg', // Replace with your image asset
                  height: 300,
                  width: 300,
                ),
                const SizedBox(height: 20),
                Text(
                  "Welcome Back!",
                  style:GoogleFonts.acme(
                      color: Colors.black,
                    fontSize: 45,
                  )
                ),
              ],
            ),
          ),
          // Bottom arrow button
          const Positioned(
            bottom: 40,
            right: 30,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_forward, color: Colors.black,
            ),
            )),
        ],
      ),
    );
  }
}
