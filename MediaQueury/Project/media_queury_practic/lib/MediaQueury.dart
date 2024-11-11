// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter MediaQueury Practices',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//
//
//   void _incrementCounter() {
//     setState(() {
//
//       _counter++;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//       final size = MediaQuery.of(context).size;
//       final Size(:height, :width) = size;
//       final clientSide = height-kToolbarHeight;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       // media queury basically humain poori screen ka size deta hia or ager hum app bar ko remove kryn gy to ye humain errrro ni dy ga or ager hum appBar place kryn gy to ye error dy ga overflow ka
//
//       body: Column(
//         children: [
//           Container(
//             height: clientSide*0.3,
//             color: Colors.amber,
//
//           ),
//           SizedBox(
//             height: clientSide*0.7,
//              child: Row(
//                children: [
//                  Container(
//                    color: Colors.blue,
//                    width: width*0.3,
//
//                  ),
//                  Container(
//                    color: Colors.greenAccent,
//                    width: width*0.4,
//
//                  ),
//                  Container(
//                    color: Colors.orangeAccent,
//                    width: width*0.3,
//
//                  ),
//                ],
//              ),
//           ),
//
//         ],
//
//
//           ),);
//   }
// }
