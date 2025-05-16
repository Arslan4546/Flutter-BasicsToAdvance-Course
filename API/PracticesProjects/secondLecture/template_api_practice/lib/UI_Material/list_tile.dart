import 'package:flutter/material.dart';
import 'package:template_api_practice/API_Service/product_model.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.products});
  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(products.name),
      title: Text(products.title),
      leading: CircleAvatar(backgroundImage: NetworkImage(products.image)),
    );
  }
}
