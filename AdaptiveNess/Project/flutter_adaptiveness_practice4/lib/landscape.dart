import 'package:flutter/material.dart';

class Landscape extends StatelessWidget {
  const Landscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Opacity
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
          // Landscape Layout with Row
          Row(
            children: [
              // Profile Image and Sign-up Title Section
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.black,
                      backgroundImage:
                          const AssetImage("assets/images/man.png"),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 4),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
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
                  ],
                ),
              ),
              // Form Fields Section
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20,top: 40 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildTextField("Enter your Name"),
                      const SizedBox(height: 20),
                      _buildTextField("Enter your Email"),
                      const SizedBox(height: 20),
                      _buildTextField("Enter your Password"),
                      const SizedBox(height: 20),
                      _buildTextField("Re-Type Password"),
                      const SizedBox(height: 30),
                      _buildSignUpButton(),
                      const SizedBox(height: 30),
                      _buildDividerOr(),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have An Account ? ",style: TextStyle(
                            color: Colors.white,

                          ),),
                          Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper functions to build individual widgets
  Widget _buildTextField(String hintText) {
    return Container(
      height: 60,
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
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            hintText,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      height: 50,
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
              color: Colors.black),
          BoxShadow(
              offset: Offset(-2, -2),
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.white),
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
    );
  }

  Widget _buildDividerOr() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("Or", style: TextStyle(color: Colors.white)),
        ),
        const Expanded(child: Divider(color: Colors.white)),
      ],
    );
  }

  Widget _buildSocialButton(String text, String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
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
                image: DecorationImage(
                    image: AssetImage(assetPath), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already Have An Account?",
            style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {},
          child: const Text(" Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
