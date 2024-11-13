import 'package:flutter/material.dart';





class Portrait extends StatelessWidget {
  const Portrait({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image
            Container(
              width: 170,
              height:170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800],
                image: const DecorationImage(
                  image: AssetImage('assets/images/a.png'), // Replace with your asset image
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
SizedBox(height: 30,),
            // Title and Description
            Text(
              "Hi, I'm Arslan 👋",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(height: 10),
            Text(
              "Experienced Flutter Developer and Team Lead with a passion for crafting high-quality mobile apps. Skilled in code review, task management, and clean architecture.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: screenWidth * 0.04,
              )
            ),
            const SizedBox(height: 20),
            // Location and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.greenAccent[400],
                  size: screenWidth * 0.05,
                ),
                const SizedBox(width: 5),
                Text(
                  "Bahawalpur, Pakistan",
                  style:TextStyle( color: Colors.grey[400],
                    fontSize: screenWidth * 0.04,)
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.greenAccent[400],
                  size: screenWidth * 0.03,
                ),
                const SizedBox(width: 5),
                Text(
                  "Available for Intresting projects",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: screenWidth * 0.04,
                  )
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Contact Button
            SizedBox(
              width: screenWidth * 0.5,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[850],
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Connect Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
