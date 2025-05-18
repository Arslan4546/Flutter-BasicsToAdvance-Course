import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation2_example/routes/app_routes.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  Future<bool> _backpressedbutton(BuildContext context) async {
    final backpress = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Are You Want to sure?'),
            content: Text('Do you Want to go to back screen?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
            ],
          ),
    );
    if (backpress == true) {
      context.go(AppRoutes.homepage);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(179, 219, 51, 191),
          title: Text(
            'Sign-Up',
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: ('Enter Your First Name'),
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
                  decoration: InputDecoration(
                    hintText: 'Enter Your Last Name',
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your E-mail',
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Confarm Password',
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
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(137, 10, 1, 1),
                  ),
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () => _backpressedbutton(context),
                child: Icon(Icons.arrow_back),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
