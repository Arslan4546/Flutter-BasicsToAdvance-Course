import 'package:flutter/material.dart';

class Inkwellbutton extends StatelessWidget {
  const Inkwellbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(

      child: InkWell(

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
        child: Container(child: Text("Click")),
      ),
    );
  }
}