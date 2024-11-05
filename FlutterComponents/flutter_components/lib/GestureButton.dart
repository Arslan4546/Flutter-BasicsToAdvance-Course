import 'package:flutter/material.dart';

class Gesturebutton extends StatelessWidget {
  const Gesturebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(

      onTap: (){

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Center(
              child: Text("You are Clicking This Button",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                  fontWeight: FontWeight.bold
              ),),
            ),backgroundColor: Colors.blue,
            )
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text("Click!"),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  offset: Offset(3, 3),
                  color: Colors.black
              ),

            ]
        ),
      ),
    );
  }
}
