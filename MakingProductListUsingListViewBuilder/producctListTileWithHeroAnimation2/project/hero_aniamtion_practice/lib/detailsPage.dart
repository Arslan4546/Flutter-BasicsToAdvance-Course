import 'package:flutter/material.dart';
import 'package:hero_aniamtion_practice/list_class.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    var contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Hero(
          tag: contact.name,
          child: CircleAvatar(
            backgroundImage: AssetImage(contact.photoAdress),
          ),
        ),
        Text(
          contact.name,
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ],
    );
  }
}
