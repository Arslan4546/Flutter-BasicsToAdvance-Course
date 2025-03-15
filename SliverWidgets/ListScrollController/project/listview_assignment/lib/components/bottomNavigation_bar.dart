import 'package:flutter/material.dart';

class BottomNavigationIcons extends StatefulWidget {
  final BorderRadius borderRadius;
  const BottomNavigationIcons({super.key, required this.borderRadius});

  @override
  State<BottomNavigationIcons> createState() => _BottomNavigationIconsState();
}

class _BottomNavigationIconsState extends State<BottomNavigationIcons> {
  int _selectedIndex = 1; // Default selected item

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      backgroundColor: Colors.white,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        _buildNavItem(Icons.location_on_outlined, 0),
        _buildNavItem(Icons.chat_bubble, 1),
        _buildNavItem(Icons.camera_alt_rounded, 2),
        _buildNavItem(Icons.photo_library_outlined, 3),
        _buildNavItem(Icons.play_circle_outline, 4),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius, // Use dynamic border radius
          color: _selectedIndex == index ? Colors.black : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: _selectedIndex == index ? Colors.white : Colors.grey,
          size: 25,
        ),
      ),
      label: '',
    );
  }
}
