import 'package:flutter/material.dart';
import 'package:project/Hexagon_clipper.dart';
import 'package:project/arrow_clipper.dart';
import 'package:project/circle_clipper.dart';
import 'package:project/crescent_clipper.dart';
import 'package:project/diamond_clipper.dart';
import 'package:project/kite_clipper.dart';
import 'package:project/octagon_clipper.dart';
import 'package:project/parallelogram_clipper.dart';
import 'package:project/pentagon_clipper.dart';
import 'package:project/right_angle_triangle.dart';
import 'package:project/trapezoid_clipper.dart';
import 'package:project/triangle_clipper.dart';
import 'custom_clipper_file.dart';
import 'heart_clipper.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  static const src = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi1Je60aIw2ELxrBvXQADY0ZRgosOiELrspQ&s';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Color(0xFFF7A41F),
  title: Text("Different Shapes Using Custom Clipper",style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),),
  centerTitle: true,
),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // ClipRect(borderRadius: BorderRadius.circular(30),child:
              // Image.network(src,height: 300,width: 400,fit: BoxFit.fill,)),
              // ClipOval(child: Image.asset(src,height: 300,width: 400,fit: BoxFit.fill,)),
              Column(
                children: [
                  Text("Pentagon",style: TextStyle(
                    fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: PentagonClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Diamond",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: DiamondClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Octagon",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: OctagonClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Circle",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: CircleClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),


            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // ClipRect(borderRadius: BorderRadius.circular(30),child:
              // Image.network(src,height: 300,width: 400,fit: BoxFit.fill,)),
              // ClipOval(child: Image.asset(src,height: 300,width: 400,fit: BoxFit.fill,)),
              Column(
                children: [
                  Text("Triangle",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: TriangleClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Parallelogram",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: ParallelogramClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Right-Angle Triangle",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: RightTriangleClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Arrow",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: ArrowClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),


            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // ClipRect(borderRadius: BorderRadius.circular(30),child:
              // Image.network(src,height: 300,width: 400,fit: BoxFit.fill,)),
              // ClipOval(child: Image.asset(src,height: 300,width: 400,fit: BoxFit.fill,)),
              Column(
                children: [
                  Text("Hexagon",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: HexagonClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("kite",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: KiteClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Rectangle",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(

                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Trapezoid",style: TextStyle(
                      fontSize: 18
                  ),),
                  SizedBox(height: 10,),
                  ClipPath(
                    clipper: TrapezoidClipper(),
                    child: Image.network(
                      src,
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),


            ],
          ),

        ],
      ),
    );
  }
}
