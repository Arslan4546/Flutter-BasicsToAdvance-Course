import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Gradient Propery In Container",style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
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
                    ],
                  gradient: LinearGradient(colors: [
                    Colors.blueGrey,
                    Colors.red,
                    Colors.greenAccent,
                    Colors.amber,
                    Colors.black
                  ],
                    stops: [0.2,0.5, 0.7,0.9,1,],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,


                  )


                   ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
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
                    ],
                    gradient: LinearGradient(colors: [
                      Colors.blueGrey,
                      Colors.red,
                      Colors.greenAccent,
                      Colors.amber,
                      Colors.black
                    ],
                      stops: [0.1,0.4, 0.7,0.9,1,],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,


                    )


                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
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
                    ],
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.green,
                      Colors.red,
                      Colors.yellow,
                      Colors.amber
                    ],
                      stops: [0.2,0.5, 0.7,0.9,1,],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      tileMode: TileMode.repeated
                        // basically iss property ka mtlab he ye hai k ager ap ny just 2 color add kyee hian to ye on dono colors ko repeate kry ga until k sara area full na ho jyee



                    )


                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
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
                    ],
                    gradient: LinearGradient(colors: [
                      Colors.black,
                      Colors.yellow,
                      Colors.green,
                      Colors.indigo,
                      Colors.pink
                    ],
                      stops: [0.2,0.5, 0.7,0.9,1,],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomLeft,


                    )


                ),
              ),
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
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
                    ],
                    gradient: RadialGradient(colors: [
                      Colors.blueGrey,
                      Colors.black,
                      Colors.greenAccent,
                      Colors.amber,
                      Colors.blue
                    ],
                      stops: [0.4,0.8, 0.7,0.9,1,],
                    radius: 1,
                      center: Alignment.topLeft,



                    )


                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
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
                    ],
                    gradient: RadialGradient(colors: [
                      Colors.yellow,
                      Colors.blue,
                      Colors.grey,
                      Colors.amber,
                      Colors.grey
                    ],
                      stops: [0.2,0.5, 0.6,1,0.5,],
                   center: Alignment.bottomLeft,
                      radius: 1.0



                    )


                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
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
                    ],
                    gradient: RadialGradient(colors: [
                      Colors.green,
                      Colors.blue,
                      Colors.white,
                      Colors.amber,
                      Colors.red
                    ],

                        center: Alignment.bottomLeft,
                        radius: 1.0



                    )


                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
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
                    ],
                    gradient: RadialGradient(colors: [
                      Colors.yellow,
                      Colors.blue,
                      Colors.grey,
                      Colors.amber,
                      Colors.grey
                    ],

                        center: Alignment.topRight,
                        radius: 1.0



                    )


                ),
              ),
            ],
          ),

        ],
      )
      );
  }
}
