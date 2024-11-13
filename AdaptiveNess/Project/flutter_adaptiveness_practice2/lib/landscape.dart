import 'package:flutter/material.dart';




class Landscape extends StatelessWidget {
  const Landscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text(
          '@arslan4546',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image
          SizedBox(width: 20,),
          Container(
            width: screenWidth * 0.25,
            height: screenWidth * 0.25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[800],
              image: const DecorationImage(
                image: AssetImage('assets/images/a.png'), // Replace with your asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 30),
          // Text content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, I'm Arslan 👋",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.047,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Experienced Flutter Developer and Team Lead with a passion for crafting high-quality mobile apps. Skilled in code review, task management, and clean architecture.",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: screenWidth * 0.02,
                  ),
                ),
                const SizedBox(height: 20),
                // Location and Status
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.greenAccent[400],
                      size: screenWidth * 0.03,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Bahawalpur, Pakistan",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.greenAccent[400],
                      size: screenWidth * 0.02,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Available for Interesting projects",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Contact Button
                SizedBox(
                  width: screenWidth * 0.3,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[850],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Connect Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.03,
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
