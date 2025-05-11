import 'package:api_implementing/API_Service/api_service.dart';
import 'package:api_implementing/API_Service/model_class.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  Future<List<AlbumApi>>? _futureService;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();

    // _futureService = apiService.getAbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: FutureBuilder(
          future: _futureService,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureService = apiService.getAbums();
                  });
                },
                child: Text("Error While Fetching the API data "),
              );
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              final album = snapshot.data!;
              return ListView.builder(
                itemCount: album.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(album[index].id as String),

                    subtitle: Text(album[index].title),
                  );
                },
              );
            }
          },
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
