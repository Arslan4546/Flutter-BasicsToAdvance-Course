import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation2_example/Screens/home_page.dart';
import 'package:navigation2_example/Screens/sign_up_page.dart';
import 'package:navigation2_example/routes/app_routes.dart';

class AppRouter {
  late final GoRouter router;
  AppRouter() {
    router = GoRouter(
      initialLocation: AppRoutes.homepage,
      routes: [
        GoRoute(
          path: AppRoutes.homepage,
          builder: (context, state) => const Homepage(),
        ),
        GoRoute(
          path: AppRoutes.signuppage,
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    );
  }
}
