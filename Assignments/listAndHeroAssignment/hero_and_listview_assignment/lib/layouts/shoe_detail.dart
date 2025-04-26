import 'package:flutter/material.dart';
import 'package:hero_and_listview_assignment/shoe_model.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({super.key});
  static const String routeName = '/shoe_page';

  @override
  Widget build(BuildContext context) {
    final ShoeModel shoe =
        ModalRoute.of(context)!.settings.arguments as ShoeModel;
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
              child: Hero(
                tag: shoe.id!,
                child: Image.network(
                  shoe.imgSrc!,
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: 320,
              left: 20,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name!,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.black,
                          fontFamily: "PlayfairDisplay",
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "\$${shoe.price}",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontFamily: "CascadiaMono",
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    shoe.description!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontFamily: "CascadiaMono",
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
