import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LinkedInProfileScreen(),
    );
  }
}

class LinkedInProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            height: 150,

            decoration: const BoxDecoration(

              image: DecorationImage(image: AssetImage("assets/images/back.jpg"),
              fit: BoxFit.fitWidth)
            ),// Background color for cover photo
          ),
          const Positioned(
            top: 80,
            left: 16,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                    'assets/images/arslan.jpg'), // Replace with profile picture URL
              ),
            ),
          ),
          const Positioned(
            top: 16,
            right: 16,
            child: Icon(Icons.edit, color: Colors.white),
          ),

          // Profile Name and Information
          Padding(
            padding: const EdgeInsets.only(top: 190, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Arslan Tariq",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "Mobile Application Developer (Flutter) | Dart Master | Collaborative Engineer | UI/UX Expert. ",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 4),
                Text(
                  "Talks about #development, #problems, and #solutions",
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
                const SizedBox(height: 8),
                Text(
                  "CAS - Center For Advance Solutions\nBahawalpur, Punjab, Pakistan",
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
              ],
            ),
          ),

          // Connection Details and Open To Section
          Padding(
            padding: const EdgeInsets.only(top: 340.0,left: 10,right: 20),
            child: Row(
              children: [
                const Text(
                  "16,022 followers • 500+ connections",
                  style: TextStyle(color: Colors.blue),
                ),
                const Spacer(),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 370.0,left: 10),
            child: Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.business_center, color: Colors.blue,size: 15,),
                  label: const Text("Open to", style: TextStyle(color: Colors.blue)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                  ),
                ),
                const SizedBox(width: 10,),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.business_center, color: Colors.blue,size: 15,),
                  label: const Text("Enhance Profile ", style: TextStyle(color: Colors.blue,
                  fontSize: 15)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                  ),
                ),



              ],
            ),
          ),

          // Analytics Section
          const Padding(
            padding: EdgeInsets.only(top: 430.0,left: 10,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Analytics", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Private to you", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 16),

                Row(
                  children: [
                    Icon(Icons.visibility, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("351 profile views", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 4),
                Text("Discover who's viewed your profile.", style: TextStyle(color: Colors.grey, fontSize: 12)),

                Divider(height: 30, thickness: 1),

                Row(
                  children: [
                    Icon(Icons.insights, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("44,664 post impressions", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 4),
                Text("Check out who's engaging with your posts.", style: TextStyle(color: Colors.grey, fontSize: 12)),

                Divider(height: 30, thickness: 1),

                Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("102 search appearances", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
