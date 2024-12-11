import 'package:different_screens/verticalList.dart';
import 'package:flutter/material.dart';

class VerticalScreen extends StatelessWidget {
  const VerticalScreen({super.key, required this.SHeight, required this.SWidth});

  final double SWidth;
  final double SHeight;

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
      body: Builder(
          builder: (context) {
            return Column(

              children: [
                Container(

                  width: double.infinity,
                  height: SHeight*0.2,
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

                              height: SHeight*0.2,
                              width: SWidth*0.2,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,


                              ),
                            ),
                            SizedBox(width: SWidth*0.09,),
                            Column(
                              children: [
                                Text("Arslan Tariq",style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SWidth*0.1,
                                ),),
                                Text("Flutter Developer",style: TextStyle(
                                  color: Colors.black,

                                  fontSize: SWidth*0.05,
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
                Padding(
                  padding:  EdgeInsets.only(left: 15.0,right: 15,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("My Tasks",style: TextStyle(
                        color: Colors.black,
                        fontSize: SWidth*0.06,
                        fontWeight: FontWeight.bold,

                      ),),
                      Container(
                        width: SWidth*0.1,
                        height: SHeight*0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:Color(0xff2E7074),
                        ),
                        child: Icon(Icons.calendar_month,color: Colors.white,),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 15.0,right: 15,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                        width: SWidth*0.1,
                        height: SHeight*0.05,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,


                        ),
                      ),
                      SizedBox(width: SWidth*0.03,),
                      Text("5 Tasks I Started.",style: TextStyle(
                        color: Colors.grey,

                        fontSize: SWidth*0.04,
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: SHeight*0.01,left: 15.0,right: 15,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                        width: SWidth*0.1,
                        height: SHeight*0.05,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,


                        ),
                      ),
                      SizedBox(width: SWidth*0.03,),
                      Text("5 Tasks I Started.",style: TextStyle(
                        color: Colors.grey,

                        fontSize: SWidth*0.04,
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: SHeight*0.01,left: 15.0,right: 15,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                        width: SWidth*0.1,
                        height: SHeight*0.05,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,


                        ),
                      ),
                      SizedBox(width: SWidth*0.03,),
                      Text("5 Tasks I Started.",style: TextStyle(
                        color: Colors.grey,

                        fontSize: SWidth*0.04,
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: SHeight*0.01,left: 15.0,right: 15,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                        width: SWidth*0.1,
                        height: SHeight*0.05,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,


                        ),
                      ),
                      SizedBox(width: SWidth*0.03,),
                      Text("5 Tasks  Started.",style: TextStyle(
                        color: Colors.grey,

                        fontSize: SWidth*0.04,
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: SHeight*0.01,left: 15,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Activity Projects" , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SWidth*0.07,

                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: SHeight*0.01,left: 15,right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                            builder: (context,constraints) {
                              double conWidth = constraints.maxWidth;
                              double conHeight = constraints.maxHeight;
                              return Container(
                                height: SHeight*0.2,
                                child: Center(
                                  child: Text("Arslan is the best student Ever",style: TextStyle(color: Colors.black,


                                      fontSize: conWidth*0.06),),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(40),


                                ),


                              );
                            }
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: LayoutBuilder(
                            builder: (context,constraints) {
                              double conWidth = constraints.maxWidth;
                              double conHeight = constraints.maxHeight;
                              return Container(
                                height: SHeight*0.2,
                                child: Center(
                                  child: Text("Arslan is the best student Ever",style: TextStyle(color: Colors.black,


                                      fontSize: conWidth*0.06),),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(40),


                                ),


                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            );
          }
      ),
    );
  }
}
