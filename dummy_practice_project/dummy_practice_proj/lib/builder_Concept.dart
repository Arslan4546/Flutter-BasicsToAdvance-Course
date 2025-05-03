import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';

// ye bilkul aisy he kam krega jesy Builder widget kam krta hai
class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.builder});
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return builder.call(context);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation Example'),
      ),
      body: Column(
        children: [
          Center(
            child: MyWidget(
              builder: (context) {
                return TweenAnimationBuilder<Size>(
                  tween: Tween<Size>(
                    begin: Size(100, 100),
                    end: Size(200, 200),
                  ),
                  duration: const Duration(seconds: 1),
                  builder: (context, size, child) {
                    return Container(
                      width: size.width,
                      height: size.height,
                      color: Colors.blue,
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("ARslan")));
              },
              child: const Text("Click Me")),
        ],
      ),
    );
  }
}
