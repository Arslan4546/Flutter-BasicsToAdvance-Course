import 'package:flutter/material.dart';
import 'package:flutter_adaptiveness/landscape.dart';
import 'package:flutter_adaptiveness/portrait.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, });



  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(

      body: Builder(
          builder: (context) => orientation == Orientation.portrait
              ? const Portrait()
              : const  Landscape()),
    );
  }
}
