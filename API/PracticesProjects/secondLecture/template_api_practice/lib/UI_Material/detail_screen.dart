import 'package:flutter/material.dart';
import 'package:template_api_practice/API_Service/product_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.products});
  final ProductModel products;
  @override
  Widget build(context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Text(products.name),
          Text(products.title),
          Text(products.id.toString()),
        ],
      ),
    );
  }
}
