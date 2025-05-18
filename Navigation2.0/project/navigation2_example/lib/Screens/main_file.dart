import 'package:flutter/material.dart';
import 'package:navigation2_example/app_router.dart';

class MainFile extends StatelessWidget {
  const MainFile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: ('Go Router'),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
    );
  }
}
