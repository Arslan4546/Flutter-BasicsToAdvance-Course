import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation2_practice/main.dart';
import 'package:navigation2_practice/myPageBuilder.dart';

class MyRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // This is the constructor for the MyRouterDelegate class.
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
    if (stack.length > 1) {
      stack.removeLast(); // remove last page from stack
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

  // @override
  // GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

// Page transition isn't triggering because you're using a new GlobalKey every time!
//That creates a new GlobalKey every time build() is called, which resets the navigator state and breaks animations.
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) {
    stack
      ..clear()
      ..add(configuration);
    notifyListeners();
    return SynchronousFuture(null);
  }

  bool onPopPage(Route route, result) {
    if (!route.didPop(result)) return false;
    pop(); // remove from stack
    return true;
  }

  // old code for onPopPage
  // bool onPopPage(Route route, result) {
  //   return !route.didPop(result);
  // }
}
