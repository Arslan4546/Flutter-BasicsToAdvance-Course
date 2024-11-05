
import 'package:flutter/material.dart';

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: () {
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
    }, child: Text("Click!"));
  }
}
