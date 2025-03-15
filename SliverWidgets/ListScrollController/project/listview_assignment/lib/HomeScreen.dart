import 'package:flutter/material.dart';
import 'package:listview_assignment/components/ListTileAndView.dart';
import 'package:listview_assignment/components/app_bar.dart';
import 'package:listview_assignment/components/bottomNavigation_bar.dart';
import 'package:listview_assignment/components/tab_bar.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  BorderRadius borderRadius = BorderRadius.circular(50); // Default: Circular

  void updateBorderRadius(BorderRadius newRadius) {
    setState(() {
      borderRadius = newRadius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          const TabBarWidget(),
          ListContent(
            borderRadius: borderRadius,
            onBorderRadiusChanged: updateBorderRadius, // Pass callback
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationIcons(borderRadius: borderRadius),
    );
  }
}
