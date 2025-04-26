import 'package:flutter/cupertino.dart';
import 'package:hero_and_listview_assignment/shoe_model.dart';

class Bottomselectedlist extends StatefulWidget {
  const Bottomselectedlist({super.key});

  @override
  State<Bottomselectedlist> createState() => _BottomselectedlistState();
}

class _BottomselectedlistState extends State<Bottomselectedlist> {
  List<ShoeModel> shoesList = ShoeModel.shoesList;
  String? selectedBrand;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CupertinoSlidingSegmentedControl(
        groupValue: selectedBrand,
        thumbColor: const Color(0xffD5BDAF),
        padding: const EdgeInsets.all(6),
        onValueChanged: (value) {
          if (value != null) {
            setState(() {
              if (value == selectedBrand) {
                selectedBrand = null;
                shoesList = ShoeModel.shoesList;
              } else {
                selectedBrand = value;
                shoesList = ShoeModel.shoesList
                    .where((shoe) => shoe.brand == selectedBrand)
                    .toList();
              }
            });
          }
        },
        children: const <String, Widget>{
          "Bata": Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Bata',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          "Nike": Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Nike',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          "Puma": Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Puma',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          "Adidas": Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Adidas',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
        },
      ),
    );
  }
}
