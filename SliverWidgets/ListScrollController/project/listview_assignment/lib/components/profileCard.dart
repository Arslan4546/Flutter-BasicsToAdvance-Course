import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;

  const ProfileCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'profileHero',
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Arslan Tariq",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Hi, I'm Arslan! 👋 A passionate Flutter developer who loves turning ideas into beautiful apps. When I'm not coding, I'm probably cracking jokes (or at least I think they're funny 😆).",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.code),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.email),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.business),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
