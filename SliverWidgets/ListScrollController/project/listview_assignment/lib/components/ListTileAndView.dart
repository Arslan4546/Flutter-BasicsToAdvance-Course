import 'package:flutter/material.dart';
import 'package:listview_assignment/utilities/ListTileContent.dart';

class ListContent extends StatefulWidget {
  const ListContent({super.key});

  @override
  State<ListContent> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.custom(
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
