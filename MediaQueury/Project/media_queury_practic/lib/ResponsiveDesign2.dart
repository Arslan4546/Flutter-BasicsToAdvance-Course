import 'package:flutter/material.dart';


void main(){
  runApp(const Container4());
}


class Container4 extends StatelessWidget {
  const Container4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Flexible(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: const Border(
                                  top: BorderSide(color: Colors.indigo, width: 2),
                                  bottom:
                                  BorderSide(color: Colors.indigo, width: 2),
                                  left:
                                  BorderSide(color: Colors.indigo, width: 2),
                                  right: BorderSide(
                                      color: Colors.indigo, width: 2)))),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  flex: 15,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Container(
                            child: Flexible(
                              flex: 5,
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                          border: const Border(
                                              top: BorderSide(
                                                  color: Colors.indigo, width: 2),
                                              bottom: BorderSide(
                                                  color: Colors.indigo, width: 2),
                                              left: BorderSide(
                                                  color: Colors.indigo, width: 2),
                                              right: BorderSide(
                                                  color: Colors.indigo,
                                                  width: 2)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      border: const Border(
                                                          top: BorderSide(
                                                              color:
                                                              Colors.indigo,
                                                              width: 2),
                                                          bottom: BorderSide(
                                                              color:
                                                              Colors.indigo,
                                                              width: 2),
                                                          left: BorderSide(
                                                              color:
                                                              Colors.indigo,
                                                              width: 2),
                                                          right: BorderSide(
                                                              color:
                                                              Colors.indigo,
                                                              width: 2)),
                                                    ),
                                                    child: const Icon(
                                                      Icons.check,
                                                      size: 50,
                                                      color: Colors.indigo,
                                                    )),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color: Colors.indigo,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.cyan,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.indigo,
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color: Colors.indigo,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10))))
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  flex: 7,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.cyan,
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  flex: 7,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.indigo,
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  flex: 7,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.indigo,
                            ),
                          ))
                    ],
                  ))
            ]),
          )),
    );
  }
}