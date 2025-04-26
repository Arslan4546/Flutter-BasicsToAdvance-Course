import 'package:flutter/material.dart';
import 'package:hero_and_listview_assignment/layouts/shoe_detail.dart';
import 'package:hero_and_listview_assignment/shoe_model.dart';

class ShoeListWheel extends StatefulWidget {
  const ShoeListWheel({super.key, required this.shoesList});
  final List<ShoeModel> shoesList;

  @override
  State<ShoeListWheel> createState() => _ShoeListWheelState();
}

class _ShoeListWheelState extends State<ShoeListWheel> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 300,
      overAndUnderCenterOpacity: 1,
      diameterRatio: 1.2,
      offAxisFraction: 2,
      children: List.generate(
        widget.shoesList.length,
        (index) => Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ShoePage.routeName,
                    arguments: widget.shoesList[index],
                  );
                },
                child: Hero(
                  tag: widget.shoesList[index].id!,
                  child: Image.network(
                    widget.shoesList[index].imgSrc!,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
