import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:listview_assignment/utilities/ListTileContent.dart';

class ListContent extends StatefulWidget {
  final BoxShape shape;
  final Function(BoxShape) onShapeChanged; // Callback function

  const ListContent(
      {super.key, required this.shape, required this.onShapeChanged});

  @override
  State<ListContent> createState() => _ListContentState();
}

BoxDecoration decoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
);

class _ListContentState extends State<ListContent> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.forward) {
        widget.onShapeChanged(BoxShape.circle);
      } else if (_controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        widget.onShapeChanged(
            BoxDecoration(borderRadius: BorderRadius.circular(20)).shape);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.custom(
        controller: _controller, // Use controller here
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: titleList.length,
          (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(imagesList[index]),
              ),
              title: Text(
                titleList[index],
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const Text(
                    "New Snap",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    snapList[index],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: Colors.grey,
                size: 24,
              ),
            );
          },
        ),
      ),
    );
  }
}
