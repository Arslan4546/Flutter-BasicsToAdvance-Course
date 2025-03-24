import 'package:flutter/material.dart';

import 'listOfData.dart';

class DataOfList extends StatelessWidget {
  DataOfList({this.data});
  final ListOfData? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Shoes App"),
          centerTitle: true,
          elevation: 0),
      backgroundColor: Colors.blueGrey,
      body: DataBody(data: data),
    );
  }
}

class DataBody extends StatelessWidget {
  DataBody({this.data});
  final ListOfData? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 70 / 100,
        height: MediaQuery.of(context).size.height * 50 / 100,
        decoration: BoxDecoration(
            color: Colors.white, // keeping white for better product visibility
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black12, // reduced shadow intensity
                blurRadius: 15,
                offset: Offset(0, 8),
              )
            ]),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 70 / 100,
                height: MediaQuery.of(context).size.height * 40 / 100,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(35)),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 70 / 100,
                  height: MediaQuery.of(context).size.height * 40 / 100,
                  decoration: BoxDecoration(
                      color: Colors.white, // subtle background
                      borderRadius: BorderRadius.circular(35)),
                ),
              ),
            ),
            Center(
              child: Hero(tag: data!.id!, child: Image.asset(data!.img!)),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      data!.name!,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "\$${data!.prise.toString()}",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
