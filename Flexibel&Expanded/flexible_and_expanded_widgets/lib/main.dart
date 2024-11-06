import 'package:flutter/material.dart';

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
      title: 'Flutter ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flexible And Expanded Widget'),
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
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
             color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                        color: Colors.black,
                                            ),
                      ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
          )
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child:Container(
                      color: Colors.orange,

                )),
                Expanded(
                    flex: 3,
                    child:Container(
color: Colors.black,
                    )),
                Expanded(
                    flex: 3,
                    child:Container(
                      color: Colors.greenAccent,

                    )),
              ],

            ),
          )
        ],
      ),

    );
  }
}
