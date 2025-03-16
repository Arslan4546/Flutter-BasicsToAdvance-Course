import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:listview_assignment/utilities/ListTileContent.dart';
import 'package:listview_assignment/components/bottomSheet.dart';

class ListContent extends StatefulWidget {
  final BorderRadius borderRadius;
  final Function(BorderRadius) onBorderRadiusChanged;
  final String searchQuery;

  const ListContent({
    super.key,
    required this.borderRadius,
    required this.onBorderRadiusChanged,
    required this.searchQuery,
  });

  @override
  State<ListContent> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.forward) {
        // When scrolling up → fully circular
        widget.onBorderRadiusChanged(BorderRadius.circular(50));
      } else if (_controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // When scrolling down → slightly rounded rectangle
        widget.onBorderRadiusChanged(BorderRadius.circular(15));
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
    // Filter items based on search query
    List<int> filteredIndices = [];
    for (int i = 0; i < titleList.length; i++) {
      if (titleList[i]
          .toLowerCase()
          .contains(widget.searchQuery.toLowerCase())) {
        filteredIndices.add(i);
      }
    }

    // Ensure matched items appear at the top
    filteredIndices.sort((a, b) => titleList[a].compareTo(titleList[b]));

    return Expanded(
      child: ListView.custom(
        itemExtent: 60,
        controller: _controller,
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: filteredIndices.isEmpty
              ? titleList.length
              : filteredIndices.length, // Attach controller
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
              trailing: IconButton(
                icon: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Colors.grey,
                  size: 24,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetContent(
                        imageUrl: imagesList[index],
                        title: titleList[index],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
