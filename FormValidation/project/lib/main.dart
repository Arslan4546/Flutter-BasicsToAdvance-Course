import 'package:flutter/material.dart';

void main() {
  runApp(const VerticalMainLayoutWidget());
}

class VerticalMainLayoutWidget extends StatefulWidget {
  const VerticalMainLayoutWidget({super.key});

  @override
  State<VerticalMainLayoutWidget> createState() => _VerticalMainLayoutWidgetState();
}

class _VerticalMainLayoutWidgetState extends State<VerticalMainLayoutWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final Size(:height, :width) = size;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow.withOpacity(0.8),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.3,
                      color: Colors.yellow.withOpacity(0.5),
                      child: Container(
                        width: width * 0.3,
                        height: height * 0.3,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/image/person2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Let's get you set up",
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: width * 0.04,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      "It should only take a couple of minutes",
                      style: TextStyle(
                        color: Colors.black87,
                        fontStyle: FontStyle.italic,
                        fontSize: width * 0.03,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field cannot be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.04,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: height * 0.02,
                                width: width * 0.02,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text("Female"),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: height * 0.02,
                                width: width * 0.02,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text("Male"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return value.isValidEmail() ? null : 'Invalid email format';
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return value.isValidBirth() ? null : 'Invalid format. Use dd/mm/yyyy';
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          if (value.length < 11) {
                            return 'The number must be at least 11 digits';
                          }
                          if (!RegExp(r'^\d+\$').hasMatch(value)) {
                            return 'Please enter numbers only';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.05),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Form Submitted Successfully!')),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
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

extension StringValidation on String? {
  bool isValidBirth() {
    final reg = RegExp(r'^\d{2}[-/]\d{2}[-/]\d{4}\$');
    return this != null && reg.hasMatch(this!);
  }

  bool isValidEmail() {
    if (this == null || this!.isEmpty) return false;
    final reg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$');
    return reg.hasMatch(this!);
  }
}
