import 'package:dummy_navigation_practice/error_Page.dart';
import 'package:dummy_navigation_practice/pageTransition.dart';
import 'package:dummy_navigation_practice/first_page.dart';
import 'package:dummy_navigation_practice/main.dart';
import 'package:dummy_navigation_practice/second_Page.dart';
import 'package:flutter/material.dart';

class Mynavigations {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (settings.name == MyHomePage.pageName) {
      return MaterialPageRoute(
        builder: (context) => MyHomePage(title: "This is Home Page "),
        settings: settings,
      );
    } else if (settings.name == FirstPage.pageName) {
      return FirstPageTransition(
          page: FirstPage(data: settings.arguments as String),
          settings: settings);
    } else if (settings.name == SecondPage.pageName) {
      return SecondPageTransition(page: SecondPage(), settings: settings);
    } else {
      return MaterialPageRoute(
        builder: (context) => ErrorPage(),
        settings: settings,
      );
    }
  }
}
