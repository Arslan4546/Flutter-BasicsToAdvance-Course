import 'package:flutter/material.dart';
import 'package:nested_json_practice/api_service.dart';
import 'package:nested_json_practice/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Product>>? _futureProductsList;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureProductsList = apiService.getProductAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: _futureProductsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final product = snapshot.data!;
              return Text(product[0].height.toString());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
