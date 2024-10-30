import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(
        title: "Container Practice",
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(162, 162, 162, 162),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, -3),
                      blurRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(4, 4),
                      blurRadius: 2,
                    )
                  ]),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, -3),
                      blurRadius: 2,
                      spreadRadius: 2

                    ),
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(3, 3),
                        blurRadius: 2,
                        spreadRadius:2
                    )
                  ]),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,

                      blurRadius: 3,
                      offset: Offset(3, 3)
                    ),
                    BoxShadow(
                      color: Colors.black,

                        blurRadius: 3,
                      offset: Offset(-3, -3)

                    )
                  ]),

            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(-3, -3),
                        blurRadius: 2,
                        spreadRadius: 2

                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(3, 3),
                        blurRadius: 2,
                        spreadRadius:2
                    )
                  ]),
            ),
          ],
        )
      ]),
    );
  }
}
