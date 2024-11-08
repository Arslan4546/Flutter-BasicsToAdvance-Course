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

  static const scr = "data:image/jpeg;base64,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";
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Stack(
        children: [
          Container(
          color: Colors.white,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 230,),
                Padding(
                  padding:const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            offset: Offset(-3,-3),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.black,
                          ),
                          const BoxShadow(
                            offset: Offset(7, 1),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.white70,
                          ),
                        ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey,
                      )
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter your Name")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding:const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            offset: Offset(-3,-3),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.black,
                          ),
                          const BoxShadow(
                            offset: Offset(7, 1),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.white70,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey,
                        )
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter your Email")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

                Padding(
                  padding:const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            offset: Offset(-3,-3),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.black,
                          ),
                          const BoxShadow(
                            offset: Offset(7, 1),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.white70,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey,
                        )
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter Your Password")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding:const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            offset: Offset(-3,-3),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.black,
                          ),
                          const BoxShadow(
                            offset: Offset(7, 1),
                            // blurRadius: 1,
                            // spreadRadius: 1,
                            color: Colors.white70,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey,
                        )
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Re-Type Password")
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height:60,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Colors.black,
                          Colors.blueGrey,

                          Colors.black

                        ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        boxShadow:const  [
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
                        border: Border.all(color: Colors.white70,
                          width: 2,

                        )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign Up",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,

                        ),)
                      ],
                    ),
                  ),
                ),
               const SizedBox(height: 30,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),

                  child: const Row(
                    children: [
                      Flexible(
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Text(" Or ",style: TextStyle(
                        color: Colors.black,
                      ),),
                      Flexible(
                        child: Divider(
                          color: Colors.black,

                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30,),

                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                      boxShadow: [
                        const BoxShadow(
                          offset: Offset(-2,-2),
                          // blurRadius: 1,
                          // spreadRadius: 1,
                          color: Colors.black,
                        ),
                        const BoxShadow(
                          offset: Offset(2, 1),
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
                                image: AssetImage(
                                    "assets/images/facebook.png"
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                        const SizedBox(width: 10,),
                        const Text("Continue With Facebook",style: TextStyle(
                          fontFamily: "fontMain1",
                          fontSize: 12,

                        ),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),

                GestureDetector(
                  onTap: (){

                  },
                  child: Container(

                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                      boxShadow: [
                        const BoxShadow(
                          offset: Offset(-2,-2),
                          // blurRadius: 1,
                          // spreadRadius: 1,
                          color: Colors.black,
                        ),
                        const BoxShadow(
                          offset: Offset(2, 1),
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
                                image: AssetImage(
                                    "assets/images/google.png"
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                        const SizedBox(width: 10,),
                        const Text("Continue With Google",style: TextStyle(

                          fontSize: 12,

                        ),)
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Center(
                        child: Text("Already Have An Account?",style: TextStyle(
                            color: Colors.black
                        ),),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child:  Center(
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: const Text(" Login",style: TextStyle(
                              fontWeight: FontWeight.bold,

                          ),),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

          Container(
              height: 200,
            width: double.infinity,
            decoration:   BoxDecoration(
                color: const Color(0xFF836FE7),
                border: Border.all(color: Colors.white,width: 2),
                borderRadius: const BorderRadius.only(
                  bottomLeft:Radius.circular(1500),

                ),
              boxShadow:const  [
                BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 3,
                  spreadRadius: 3,
                  color: Colors.black,
                ),
                BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.black,
                ),
              ],
              gradient: const LinearGradient(colors: [
               Colors.blueGrey,
                Colors.black,



              ],

              begin: Alignment.topRight,
              end: Alignment.bottomLeft)
            ),

          ),
          Positioned(
            top: 85,
            left: 20,
            child: Container(
              height: 120,
              width: 120,
              decoration:   BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(color: Colors.white,width: 4),
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
                image: const DecorationImage(image: NetworkImage(scr),
                  fit: BoxFit.cover,

                ),

              ),
            ),
          ),

          const Positioned(
              top: 60,
              left: 160,
              child: Text("Sign Up",style: TextStyle(color: Colors.white,
            fontSize: 60,
                fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      offset: Offset(-2, 2),
                      blurRadius: 3,

                    )
                  ]
          ),))
          

        ],
      )

    );
  }
}
