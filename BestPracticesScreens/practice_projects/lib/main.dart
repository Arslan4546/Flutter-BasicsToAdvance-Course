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
    return Scaffold(

      drawer: Drawer(


      ),
      appBar: AppBar(
foregroundColor: Colors.white,
backgroundColor: Colors.brown,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.white,),
          ),

        ],
      ),
      body: Column(

        children: [
         Container(

           width: double.infinity,
           height: 250,
           decoration: BoxDecoration(
             color: Colors.brown,
             borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(50),
               bottomRight: Radius.circular(50),
             ),
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Container(

                     height: 100,
                       width: 100,
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       shape: BoxShape.circle,


                     ),
                   ),
                     SizedBox(width: 20,),
                     Column(
                       children: [
                         Text("Arslan Tariq",style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 35,
                         ),),
                         Text("Flutter Deveoper",style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 18,
                         ),)
                       ],
                     )
                   ],
                 ),
               ),
             ],
           ),

         ),

        ],
      ),
    );
  }
}
