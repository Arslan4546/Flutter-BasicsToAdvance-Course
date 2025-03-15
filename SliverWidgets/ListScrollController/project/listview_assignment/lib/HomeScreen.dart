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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(),
        body: Column(
          children: [
            TabBarWidget(),
            ListContent(),
          ],
        ),
        bottomNavigationBar: BottomNavigationIcons());
  }
}
