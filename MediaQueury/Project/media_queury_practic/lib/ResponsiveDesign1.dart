import 'package:flutter/material.dart';
 void main(){
   runApp(const Boxes());
 }
class Boxes extends StatelessWidget {
  const Boxes({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                flex: 6,
                child: Row(
                  children: [
                    Expanded(
                        flex: 9,
                        child:Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        )),
                    const SizedBox(width: 10,),
                    Expanded(
                      flex:9,
                      child:Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Flexible(
                  flex: 6,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          )
                      )
                    ],
                  )),
              const SizedBox(height: 10,),
              Flexible(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 9,
                        child:Container(
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        )),
                    const  SizedBox(width: 10,),
                    Expanded(
                      flex:9,
                      child:Container(
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(20)
                          )),
                    )
                  ],
      
                ),
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}