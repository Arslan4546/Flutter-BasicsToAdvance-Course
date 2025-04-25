import 'package:flutter/material.dart';
import 'package:hero_aniamtion_practice/list_class.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    var contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: contact.name,
              child: CircleAvatar(
                backgroundImage: NetworkImage(contact.photoAdress),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
