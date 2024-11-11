import 'package:flutter/material.dart';


void main(){
  runApp(const  Boxshadow());
}
class Boxshadow extends StatelessWidget {
  const Boxshadow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white10,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color:  Colors.blueAccent,
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),
      
                      Container(
                        height: 100,
                        width: 100,
                        decoration:  const BoxDecoration(
                            color:  Colors.indigo,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                        ),
                      ),
      
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const  BoxDecoration(
                            color: Colors.green,
                            borderRadius:  BorderRadius.vertical(top: Radius.elliptical(30, 30))
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color:  Colors.black,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
      
                      Container(
                        height: 100,
                        width: 100,
                        decoration:const   BoxDecoration(
                            color:  Colors.purple,
                            borderRadius:  BorderRadius.only(topLeft: Radius.circular(100),)
                        ),
                      ),
      
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const  BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius:  BorderRadius.vertical(bottom: Radius.circular(30))
                        ),
                      )
                    ],
                  ),
                  const  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color:  Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(0)
                        ),
                      ),
      
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const  BoxDecoration(
                            color:  Colors.green,
                            borderRadius:  BorderRadius.only(topRight: Radius.circular(50),bottomLeft: Radius.circular(50))
                        ),
                      ),
      
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const  BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(50),topRight: Radius.circular(50),bottomRight: Radius.circular(50)
                            )
                        ),
                      )
                    ],
                  ),
                  const  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color:  Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
      
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const  BoxDecoration(
                            color:  Colors.cyan,
                            borderRadius:  BorderRadius.only(topRight: Radius.circular(100),)
                        ),
                      ),
      
                      Container(
                        height: 100,
                        width: 50,
                        decoration:   BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(30)
      
                        ),
                      )
                    ],
                  ),
                ]
            ),
          )
      ),
    );

  }
}