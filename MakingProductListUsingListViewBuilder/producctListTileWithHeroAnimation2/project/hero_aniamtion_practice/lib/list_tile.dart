import 'package:flutter/material.dart';
import 'package:hero_aniamtion_practice/detailsPage.dart';
import 'package:hero_aniamtion_practice/list_class.dart';

class ListTileContent extends StatelessWidget {
  const ListTileContent({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Hero(
          tag: contact.name,
          child: CircleAvatar(
            backgroundImage: NetworkImage(contact.photoAdress),
          ),
          flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) =>
              flightContext.widget,
        ),
        title: Text(contact.name),
        subtitle: Text(contact.description),
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const Detailspage(),
              settings: RouteSettings(arguments: contact),
              transitionDuration: const Duration(seconds: 1),
              reverseTransitionDuration: const Duration(seconds: 1),
            ),
          );
        });
  }
}
