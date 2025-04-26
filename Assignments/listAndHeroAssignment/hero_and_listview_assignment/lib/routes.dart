import 'package:flutter/material.dart';
import 'package:hero_and_listview_assignment/layouts/main_page.dart';
import 'package:hero_and_listview_assignment/layouts/shoe_detail.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MainPage(),
        settings: settings,
      );
    case ShoePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ShoePage(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const MainPage(),
        settings: settings,
      );
  }
}
