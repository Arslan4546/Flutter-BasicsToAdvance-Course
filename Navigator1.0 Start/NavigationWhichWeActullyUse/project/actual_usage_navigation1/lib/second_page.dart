import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.dataList});
  final List<String> dataList;
  static const String pageName = '/second_page';

  @override
  Widget build(BuildContext context) {
    List<String> myList = [
      "Arslan ",
      "Ali ",
      "Hassan ",
      "Tariq ",
      "Saqib ",
      "Awais ",
      "Usama ",
      "Ali ",
      "Hassan ",
      "Tariq ",
      "Saqib ",
      "Awais ",
      "Usama ",
      "Ali ",
      "Hassan ",
      "Tariq ",
      "Saqib ",
      "Awais ",
      "Usama "
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(myList);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: Center(
                child: Text(
              dataList[index],
              style: TextStyle(color: Colors.white),
            )),
          ),
          itemCount: dataList.length,
        ),
      ),
    );
  }
}
