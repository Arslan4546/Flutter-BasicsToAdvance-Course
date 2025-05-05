import 'package:actual_usage_navigation1/error_page.dart';
import 'package:actual_usage_navigation1/main.dart';
import 'package:actual_usage_navigation1/pageTransitionfile.dart';
import 'package:actual_usage_navigation1/second_page.dart';
import 'package:actual_usage_navigation1/third_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MyHomePage.pageName:
      return MaterialPageRoute(
        builder: (context) => const MyHomePage(title: 'Home Page'),
        settings: settings,
      );
    case SecondPage.pageName:
      return LeftSlidePageTransition(
        page: SecondPage(dataList: settings.arguments as List<String>),
        settings: settings,
      );
    case ThirdPage.pageName:
      return LeftSlidePageTransition(
        page: const ThirdPage(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const ErrorPage(),
        settings: settings,
      );
  }
}
