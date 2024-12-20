import 'package:flutter/material.dart';
import 'package:form_assignment/Orientations/landscapeScreen.dart';
import 'Orientations/portraitScreen.dart';


void main() {
  runApp(const EventRegistrationApp());
}

class EventRegistrationApp extends StatelessWidget {
  const EventRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return  Scaffold(
      body: Builder(
          builder: (context) => orientation == Orientation.portrait
              ? PortraitScreen()
              : Landscapescreen()),
    );
    
  }
}


