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
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           CircleAvatar(
             radius: 100,
           backgroundImage: AssetImage(carImage,),
             // iss widget ka ye nuksan  hai k iss mai image ko humm fit propery ni dy skty
             //child: Image(image: AssetImage(carImage),fit: BoxFit.fill,),
             // ager humm circular avatar mai ye cheez dyn gy to ye tab bhi image ko fit ni kry ga fit propery deny k bavajood bhi
             // iss k lyee humm backgroundImage property use kryn gy
           ),

            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(carImage),fit: BoxFit.cover),
                boxShadow:const [
                  BoxShadow(
                    offset: Offset(2, 2),
                    color: Colors.black,
                    blurRadius: 5,
                    spreadRadius: 6,

                  ),
                  BoxShadow(
                    offset: Offset(-2, -2),
                    color: Colors.white,
                    blurRadius: 5,
                    spreadRadius: 6,

                  )
                ]
              ),
            )
          ],


        ),
      )
      );
  }
}
