import 'package:flutter/material.dart';
import 'package:hero_aniamtion_practice/list_class.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    var contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("exit")),
            const SizedBox(
              height: 20,
            ),
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
