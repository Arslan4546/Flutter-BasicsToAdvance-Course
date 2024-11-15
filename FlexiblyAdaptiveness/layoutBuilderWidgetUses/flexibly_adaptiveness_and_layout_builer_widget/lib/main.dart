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
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.landscape? const Landscape() : const Portrait();
      },),

    );
  }
}



class Portrait extends StatelessWidget {
  const Portrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}


class Landscape extends StatelessWidget {
  const Landscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          child: Column(
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

                    child: LayoutBuilder(
                      builder: (context, constraints) =>
                         Row(
    mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: constraints.maxWidth*0.4,
                              color:  Colors.orange,
                            ),
    Container(
    width: constraints.maxWidth*0.4,
      color: Colors.teal,
    )
                          ],
                        ),

                    ),
                    // Basically builder

                  )),
            ],

          ),
        )
      ],
    );
  }
}


