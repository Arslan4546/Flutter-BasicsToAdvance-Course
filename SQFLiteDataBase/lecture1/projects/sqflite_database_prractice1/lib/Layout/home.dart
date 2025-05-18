import 'package:flutter/material.dart';
import 'package:sqflite_database_prractice1/DataBase/db_crud_service.dart';
import 'package:sqflite_database_prractice1/Layout/home_components.dart';
import 'package:sqflite_database_prractice1/Models/student_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _rollNoController = TextEditingController();
  final _emailController = TextEditingController();
  final _cgpaController = TextEditingController();
  final _phoneController = TextEditingController();

  final DbCrud _dbCrud = DbCrud();

  Future<void> _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      StudentModel student = StudentModel(
        name: _nameController.text.trim(),
        rollNo: int.parse(_rollNoController.text.trim()),
        email: _emailController.text.trim(),
        cGPA: double.parse(_cgpaController.text.trim()),
        phone: _phoneController.text.trim(),
      );

      bool inserted = await _dbCrud.insertStudent(student);

      if (inserted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student added successfully!')),
        );
        _nameController.clear();
        _rollNoController.clear();
        _emailController.clear();
        _cgpaController.clear();
        _phoneController.clear();
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to add student')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: _nameController,
                    labelText: "Name",
                    validator:
                        (value) => value!.isEmpty ? "Enter the name" : null,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    controller: _emailController,
                    labelText: "Email",
                    validator:
                        (value) => value!.isEmpty ? "Enter the email" : null,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    controller: _rollNoController,
                    labelText: "Roll No",
                    validator:
                        (value) => value!.isEmpty ? "Enter the rollNo" : null,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    controller: _phoneController,
                    labelText: "Phone No",
                    validator:
                        (value) => value!.isEmpty ? "Enter the Phone" : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _saveStudent,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
