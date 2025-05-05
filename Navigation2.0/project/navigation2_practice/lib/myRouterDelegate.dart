import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation2_practice/main.dart';
import 'package:navigation2_practice/myPageBuilder.dart';

class MyRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  static MyRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is MyRouterDelegate);
    return delegate as MyRouterDelegate;
  }

  List<RouteSettings> stack = [const RouteSettings(name: MainPage.routeName)];

  push(RouteSettings settings) {
    stack.add(settings);
    notifyListeners();
  }

  pop() {
    if (stack.isNotEmpty) {
      stack.remove(stack.last);
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        for (RouteSettings settings in stack) Mypagebuilder.buildPage(settings)
      ],
      // ignore: deprecated_member_use
      onPopPage: onPopPage,
    );
  }

  @override
  RouteSettings? get currentConfiguration => stack.isNotEmpty
      ? stack.last
      : const RouteSettings(name: MainPage.routeName);

  @override
  Future<void> setInitialRoutePath(RouteSettings configuration) {
    return setNewRoutePath(configuration);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) {
    stack
      ..clear()
      ..add(configuration);
    notifyListeners();
    return SynchronousFuture(null);
  }

  bool onPopPage(Route route, result) {
    return !route.didPop(result);
  }
}
