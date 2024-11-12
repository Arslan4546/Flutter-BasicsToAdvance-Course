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
      title: 'Stack Practices',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

        body:  Stack(
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Container(

                        decoration: const BoxDecoration(

                            image: DecorationImage(image: AssetImage("assets/images/bg1.png")
                                ,
                                fit: BoxFit.cover

                            )
                        ),),
                    ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                const SizedBox(
                  height: 230,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-3, -3),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.black,
                          ),
                          BoxShadow(
                            offset: Offset(1, 1),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.white70,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text("Enter your Name")],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-3, -3),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.black,
                          ),
                          BoxShadow(
                            offset: Offset(1, 1),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.white70,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text("Enter your Email")],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-3, -3),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.black,
                          ),
                          BoxShadow(
                            offset: Offset(1, 1),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.white70,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text("Enter your Password")],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-3, -3),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.black,
                          ),
                          BoxShadow(
                            offset: Offset(1, 1),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.white70,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text("Re-Type Password")],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.black, Colors.blueGrey, Colors.black],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 3,
                            spreadRadius: 3,
                            color: Colors.black,
                          ),
                          BoxShadow(
                            offset: Offset(-2, -2),
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Colors.white,
                          ),
                        ],
                        color: const Color(0xFF836FE7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white70,
                          width: 2,
                        )),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    children: [
                      Flexible(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        " Or ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Flexible(
                        child: Divider(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                      boxShadow:const  [
                         BoxShadow(
                          offset: Offset(-2, -2),
                          // blurRadius: 1,
                          // spreadRadius: 1,
                          color: Colors.black,
                        ),
                         BoxShadow(
                          offset: Offset(1, 1),
                          // blurRadius: 1,
                          // spreadRadius: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/facebook.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Continue With Facebook",
                          style: TextStyle(
                            fontFamily: "fontMain1",
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                      boxShadow:const  [
                         BoxShadow(
                          offset: Offset(-2, -2),
                          // blurRadius: 1,
                          // spreadRadius: 1,
                          color: Colors.black,
                        ),
                         BoxShadow(
                          offset: Offset(1, 1),
                          // blurRadius: 1,
                          // spreadRadius: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/google.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Continue With Google",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Center(
                        child: Text(
                          "Already Have An Account?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            " Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Positioned(
              top: 85,
              left: 20,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(-2, 2),
                      blurRadius: 3,
                      spreadRadius: 3,
                      color: Colors.black,
                    ),
                    BoxShadow(
                      offset: Offset(2, -2),
                      blurRadius: 2,
                      spreadRadius: 2,
                      color: Colors.black,
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage("assets/images/man.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
                top: 100,
                left: 170,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.white,
                          offset: Offset(-2, 2),
                          blurRadius: 3,
                        )
                      ]),
                ))
                  ],
                ),
          );

  }
}
