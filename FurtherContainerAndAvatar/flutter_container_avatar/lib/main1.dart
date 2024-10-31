import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Container And Avatar Widget'),
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
  final String carImage = "Assets/Images/carImage.png";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,

                    boxShadow:[
                      BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.black,
                        blurRadius: 4,
                        spreadRadius: 4,

                      ),
                      BoxShadow(
                        offset: Offset(-2, -2),
                        color: Colors.white,
                        blurRadius: 2,
                        spreadRadius: 2,

                      )
                    ]
                ),
              ),


              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-3, -3),
                      color: Colors.black, // Shadow color with opacity
                      // Position of the shadow
                      blurRadius: 8, // Amount of blur
                      spreadRadius: -5, // Negative spread to make the shadow go inward
                    ),
                    BoxShadow(
                      color: Colors.white,
                       offset: Offset(3, 3),
                      blurRadius: 8,
                      spreadRadius: -5,
                    ),
                  ],
                ),
              )

            ],


          ),
        )
    );
  }
}
