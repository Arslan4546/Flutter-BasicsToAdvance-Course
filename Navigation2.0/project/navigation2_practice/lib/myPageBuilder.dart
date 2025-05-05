import 'package:flutter/material.dart';
import 'package:navigation2_practice/error_page.dart';
import 'package:navigation2_practice/first_page.dart';
import 'package:navigation2_practice/main.dart';
import 'package:navigation2_practice/pageTransitionAnimation.dart';
import 'package:navigation2_practice/second_page.dart';

class Mypagebuilder {
  // this is the function for checking is the page is valid or not
  static bool isValidPage(RouteSettings settings) {
    return settings.name == MainPage.routeName ||
        settings.name == FirstPage.routeName ||
        settings.name == SecondPage.routeName;
  }

// this is the fucntion for routing the exact location
  static Page buildPage(RouteSettings settings) {
    switch (settings.name) {
      case MainPage.routeName:
        return MaterialPage(
          child: const MainPage(),
          arguments: settings.arguments,
          name: settings.name,
        );
      case FirstPage.routeName:
        return PageTransitionAnimation(
          page: FirstPage(data: settings.arguments as String),
          name: settings.name!,
          arguments: settings.arguments,
        );

      case SecondPage.routeName:
        return MaterialPage(
          child: const SecondPage(),
          arguments: settings.arguments,
          name: settings.name,
        );
      default:
        return MaterialPage(
          child: const ErrorPage(),
          arguments: settings.arguments,
          name: settings.name,
        );
    }
  }
}
