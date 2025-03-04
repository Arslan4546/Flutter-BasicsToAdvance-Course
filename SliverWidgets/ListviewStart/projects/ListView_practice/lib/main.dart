import 'package:flutter/material.dart';
import 'package:list_view_flutter/list_view.dart';
import 'package:list_view_flutter/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff3674B5)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'List View'),
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
  List<User> listOfUser = [
    User(userName: 'Alice Johnson', occupation: "Flutter Developer"),
    User(userName: "Bob Williams", occupation: "UI/UX Designer"),
    User(userName: "Charlie Brown", occupation: "Backend Engineer"),
    User(userName: "David Smith", occupation: "Product Manager"),
    User(userName: "Emma Davis", occupation: "Data Scientist"),
    User(userName: "Frank Thomas", occupation: "Cybersecurity Expert"),
    User(userName: "Grace Lee", occupation: "AI Researcher"),
    User(userName: "Henry Wilson", occupation: "Mobile App Developer"),
    User(userName: "Isabella Martinez", occupation: "Cloud Architect"),
    User(userName: "Jack Anderson", occupation: "Game Developer"),
    User(userName: "Karen Taylor", occupation: "DevOps Engineer"),
    User(userName: "Liam Scott", occupation: "Machine Learning Engineer"),
    User(userName: "Mia Roberts", occupation: "Blockchain Developer"),
    User(userName: "Nathan Harris", occupation: "Full Stack Developer"),
    User(userName: "Olivia White", occupation: "Software Tester"),
    User(userName: "Paul Walker", occupation: "Embedded Systems Engineer"),
    User(userName: "Quinn Carter", occupation: "Data Engineer"),
    User(userName: "Ryan Evans", occupation: "AR/VR Developer"),
    User(userName: "Sophia King", occupation: "Computer Vision Engineer"),
    User(userName: "Tom Green", occupation: "E-commerce Specialist"),
    User(userName: "Uma Patel", occupation: "Cloud Security Engineer"),
    User(userName: "Victor Hall", occupation: "Game UI Designer"),
    User(userName: "Wendy Lewis", occupation: "Technical Writer"),
    User(userName: "Xavier Young", occupation: "AI Ethics Specialist")
  ];

  void deleteListTile(int index) {
    setState(() {
      listOfUser.removeAt(index);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Deleted successfully')));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(2),
              child: UserListView(
                listOfUser: listOfUser,
                deleteFunction: deleteListTile,
              )),
        ),
      ),
    );
  }
}
