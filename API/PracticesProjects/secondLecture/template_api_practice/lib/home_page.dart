import 'package:flutter/material.dart';
import 'package:template_api_practice/API_Service/product_model.dart';
import 'package:template_api_practice/UI_Material/list_builder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<ProductModel>>? _FutureProductList;
  Future<ProductModel>? _singleProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _FutureProductList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListBuilderWidget(productList: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
