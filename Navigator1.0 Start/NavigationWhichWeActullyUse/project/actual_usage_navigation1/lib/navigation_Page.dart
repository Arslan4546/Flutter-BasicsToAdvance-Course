import 'package:actual_usage_navigation1/error_page.dart';
import 'package:actual_usage_navigation1/main.dart';
import 'package:actual_usage_navigation1/pageTransitionfile.dart';
import 'package:actual_usage_navigation1/second_page.dart';
import 'package:actual_usage_navigation1/third_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  if (settings.name == MyHomePage.pageName) {
    return MaterialPageRoute(
      builder: (context) => const MyHomePage(title: 'Home Page'),
      settings: settings,
    );
  } else if (settings.name == SecondPage.pageName) {
    return LeftSlidePageTransition(
      page: SecondPage(data: settings.arguments as String),
      settings: settings,
    );
  } else if (settings.name == ThirdPage.pageName) {
    return LeftSlidePageTransition(page: const ThirdPage(), settings: settings);
  }
  return MaterialPageRoute(builder: (context) => const ErrorPage());
}
