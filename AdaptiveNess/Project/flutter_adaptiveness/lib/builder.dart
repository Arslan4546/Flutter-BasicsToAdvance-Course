import 'package:flutter/material.dart';

class Builder extends StatelessWidget {
  const Builder({super.key, required this.builder});
  final WidgetBuilder builder;
  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
