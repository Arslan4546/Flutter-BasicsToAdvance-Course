import 'package:flutter/material.dart';
import 'package:project/PointedPeaks.dart';
import 'package:project/CircularWaveClipper.dart';
import 'package:project/SymmetricHills.dart';
import 'package:project/TiltedPeaks.dart';
import 'package:project/doubleArch.dart';
import 'package:project/DeepVellyClipper.dart';
import 'package:project/rippleShape.dart';
import 'curvyMountain.dart';



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
  static const src = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLPynU5CqrkxRO6mw007ezTri48rD3R2D4uA&s';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: const Color(0xFFF7A41F),
  title: const Text("Different Shapes Using Custom Clipper",style: TextStyle(
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
                  const Text("Circular Wave",style: TextStyle(
                    fontSize: 18
                  ),),

                  ClipPath(
                    clipper: CircularWaveClipper(),
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
                  const Text("Curvy Mountain",style: TextStyle(
                      fontSize: 18
                  ),),

                  ClipPath(
                    clipper: MountainClipper(),
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
                  const Text("Pointed ",style: TextStyle(
                      fontSize: 18
                  ),),

                  ClipPath(
                    clipper: PointedPeaksClipper(),
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
                  const Text("Double Arch",style: TextStyle(
                      fontSize: 18
                  ),),

                  ClipPath(
                    clipper: DoubleArchClipper(),
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
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // ClipRect(borderRadius: BorderRadius.circular(30),child:
              // Image.network(src,height: 300,width: 400,fit: BoxFit.fill,)),
              // ClipOval(child: Image.asset(src,height: 300,width: 400,fit: BoxFit.fill,)),
              Column(
                children: [
                  const Text("Symmetrical Hills",style: TextStyle(
                      fontSize: 18
                  ),),

                  ClipPath(
                    clipper: SymmetricHillsClipper(),
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
                  const Text("Tilted Peaks",style: TextStyle(
                      fontSize: 18
                  ),),

                  ClipPath(
                    clipper: TiltedPeaksClipper(),
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
                  const Text("Deep Velly",style: TextStyle(
                      fontSize: 18
                  ),),

                  ClipPath(
                    clipper: DeepValleyClipper(),
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
                  const Text("Ripple Shape",style: TextStyle(
                      fontSize: 18
                  ),),

                  ClipPath(
                    clipper: RippleClipper(),
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
