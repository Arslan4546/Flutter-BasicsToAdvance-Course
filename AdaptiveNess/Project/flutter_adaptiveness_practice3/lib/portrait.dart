import 'package:flutter/material.dart';

class Portrait extends StatelessWidget {
  const Portrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image with opacity
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Main Column for input fields and buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.20),

              // Input fields
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: buildInputField("Enter your Name"),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: buildInputField("Enter your Email"),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: buildInputField("Enter your Password"),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: buildInputField("Re-Type Password"),
              ),

              // Sign-up button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.03),
                  height: screenHeight * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.black, Colors.blueGrey, Colors.black],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 3,
                        spreadRadius: 3,
                        color: Colors.black,
                      ),
                      BoxShadow(
                        offset: Offset(-2, -2),
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.white,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white70, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Divider with "Or"
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: const Row(
                  children: [
                    Flexible(child: Divider(color: Colors.white)),
                    Text(" Or ", style: TextStyle(color: Colors.white)),
                    Flexible(child: Divider(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.025),

              // Social media buttons
              buildSocialButton("Continue With Facebook", "assets/images/facebook.png", screenWidth),
              SizedBox(height: screenHeight * 0.01),
              buildSocialButton("Continue With Google", "assets/images/google.png", screenWidth),
              SizedBox(height: screenHeight * 0.03),

              // Login prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have An Account?", style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      " Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Profile image and Sign-Up title
          Positioned(
            top: 70,
            left: 30,
            child: Container(
              height: screenHeight * 0.15,
              width: screenHeight * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-2, 2),
                    blurRadius: 3,
                    spreadRadius: 3,
                    color: Colors.black,
                  ),
                  BoxShadow(
                    offset: Offset(2, -2),
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Colors.black,
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage("assets/images/man.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left:200,
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(-2, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build input fields with consistent styling
  Widget buildInputField(String hintText) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(offset: Offset(-3, -3), color: Colors.black),
          BoxShadow(offset: Offset(1, 1), color: Colors.white70),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              hintText,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build social media login buttons
  Widget buildSocialButton(String text, String assetPath, double screenWidth) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: screenWidth * 0.8,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black),
          boxShadow: const [
            BoxShadow(offset: Offset(-2, -2), color: Colors.black),
            BoxShadow(offset: Offset(1, 1), color: Colors.white),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(assetPath), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
