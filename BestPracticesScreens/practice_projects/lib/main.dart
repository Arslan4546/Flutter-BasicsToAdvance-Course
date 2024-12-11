import 'package:different_screens/horizantal.dart';
import 'package:different_screens/vertical.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});




  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final Size(:height, :width) = size;
    final clientSide = height-kToolbarHeight;
    final orientation = MediaQuery.orientationOf(context);


    return Scaffold(
      body: Builder(builder: (context) => orientation == Orientation.portrait ? VerticalScreen(SHeight: clientSide, SWidth:width ) : HorizantalScreen(Sheight: clientSide,Swidth: width,) ),
    );
  }
}
