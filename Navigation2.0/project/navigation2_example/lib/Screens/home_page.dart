import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation2_example/routes/app_routes.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(179, 236, 67, 222),
          title: Text(
            'Home Page',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: ('Enter Your Name'),
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.password),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  context.go(AppRoutes.signuppage);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(137, 12, 3, 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
