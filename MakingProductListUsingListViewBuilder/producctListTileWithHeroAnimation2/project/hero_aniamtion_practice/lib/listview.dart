import 'package:flutter/material.dart';
import 'package:hero_aniamtion_practice/list_class.dart';
import 'package:hero_aniamtion_practice/list_tile.dart';

class ListviewContent extends StatelessWidget {
  const ListviewContent({super.key, required this.contact});

  final List<Contact> contact;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contact.length,
      itemBuilder: (context, index) => ListTileContent(contact: contact[index]),
    );
  }
}
