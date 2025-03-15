import 'package:flutter/material.dart';
import 'package:listview_assignment/components/profileCard.dart'; // Import the profile card widget

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  final String profileImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo03qI8I9e6YyLjjNryIjw7mJYBIyYmyh7cUfIN_rBCPwgFyrN-piafos4XNhvqrgWjOk&usqp=CAU';

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Close on tap outside
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        child: Container(
          width: 300,
          height: 350,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ProfileCard(imageUrl: profileImage), // Use ProfileCard widget
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => _showProfileDialog(context), // Show profile on tap
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Hero(
            tag: 'profileHero',
            child: CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
            ),
          ),
        ),
      ),
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Chat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Container(
          height: 45,
          width: 45,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: 45,
          width: 45,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
