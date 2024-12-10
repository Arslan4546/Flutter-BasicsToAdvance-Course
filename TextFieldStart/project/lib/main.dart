import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAppScreen(),
    );
  }
}

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {

   String data = "";

  late TextEditingController emailController;
  late TextEditingController userNameController;
  late TextEditingController passwordNameController;

  @override
  void initState() {
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordNameController = TextEditingController();
    super.initState();
    emailController.addListener(
      () {
        setState(() {
          data = emailController.text;

        });
      },
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordNameController.dispose();
    super.dispose();
  }
  OnClickButton() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:  Column(children: [
      Text(userNameController.text),
      Text(passwordNameController.text),
      Text(emailController.text),
    ],)));

    setState(() {

      userNameController.clear();
      passwordNameController.clear();
      emailController.clear();
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.text,


                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Enter Your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      gapPadding: 4,
                      borderSide: const BorderSide(
                          color: Colors.black
                      ),
                    )
                ),
              ),
            ),
            const   SizedBox(height: 20,),
            SizedBox(
              width: 300,
              child: TextField(

                controller: userNameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.start),
                    labelText: "Enter Your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      gapPadding: 4,
                      borderSide: const BorderSide(
                          color: Colors.black
                      ),
                    )
                ),
              ),
            ),
            const   SizedBox(height: 20,),
            SizedBox(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                obscuringCharacter: "*",
                controller: passwordNameController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    labelText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      gapPadding: 4,
                      borderSide: const BorderSide(
                          color: Colors.black
                      ),
                    )
                ),
              ),
            ),



            const SizedBox(height: 30,),
            Text(data),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: OnClickButton,
              child: Text("Submit"),

            )
          ],
        ),
      ),
    );
  }
}

