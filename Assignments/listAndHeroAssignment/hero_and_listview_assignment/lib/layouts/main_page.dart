import 'package:flutter/material.dart';
import 'package:hero_and_listview_assignment/layouts/bottomSelectedList.dart';
import 'package:hero_and_listview_assignment/layouts/wheelList.dart';
import 'package:hero_and_listview_assignment/shoe_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const String routeName = '/main_page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ShoeModel> shoesList = ShoeModel.shoesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EBE0),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.viewPaddingOf(context).top + 20,
          bottom: MediaQuery.viewPaddingOf(context).bottom + 6,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Shoe Haven",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.black,
                      fontFamily: "PlayfairDisplay",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ShoeListWheel(shoesList: shoesList),
            ),
            const Bottomselectedlist()
          ],
        ),
      ),
    );
  }
}
