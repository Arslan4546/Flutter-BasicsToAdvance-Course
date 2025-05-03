import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation2_practice/error_page.dart';
import 'package:navigation2_practice/myPageBuilder.dart';

class MyrouteInformationParser extends RouteInformationParser<RouteSettings> {
  @override
  Future<RouteSettings> parseRouteInformation(
      RouteInformation routeInformation) {
    // Parse the URI from the route information
    var settings = RouteSettings(name: routeInformation.uri.toString());
    if (!Mypagebuilder.isValidPage(settings)) {
      settings = const RouteSettings(name: ErrorPage.routeName);
    }
    return SynchronousFuture(settings);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteSettings configuration) {
    return RouteInformation(uri: Uri.tryParse(configuration.name!));
  }
}
