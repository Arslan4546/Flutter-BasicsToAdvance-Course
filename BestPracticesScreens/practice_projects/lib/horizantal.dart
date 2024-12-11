import 'package:flutter/material.dart';

class HorizantalScreen extends StatelessWidget {
  const HorizantalScreen({super.key,required this.Sheight, required this.Swidth});

  final double Sheight;
  final double Swidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(


      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xffF1B77A),
        actions: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.search,),
          ),

        ],
      ),
      body: Column(

              children: [
                Container(

                  width: double.infinity,
                  height: Sheight*0.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF1B77A),
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

                              height: Sheight*0.2,
                              width: Swidth*0.2,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,


                              ),
                            ),
                            SizedBox(width: Swidth*0.09,),
                            Column(
                              children: [
                                Text("Arslan Tariq",style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Swidth*0.1,
                                ),),
                                Text("Flutter Developer",style: TextStyle(
                                  color: Colors.black,

                                  fontSize: Swidth*0.05,
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
