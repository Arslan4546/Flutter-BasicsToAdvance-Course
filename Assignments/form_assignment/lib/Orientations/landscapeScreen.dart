import 'package:flutter/material.dart';

import '../components/event_details_row.dart';
import '../components/form_check_box_group.dart';
import '../components/form_input_field.dart';
import '../components/form_radio_buttons.dart';

class Landscapescreen extends StatefulWidget {
  const Landscapescreen({super.key});

  @override
  State<Landscapescreen> createState() => _LandscapescreenState();
}

class _LandscapescreenState extends State<Landscapescreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ticketController = TextEditingController();

  String? selectedGender;
  String? selectedPayment;
  List<bool> socialMediaSelections = [false, false, false];

  final List<String> socialMediaOptions = [
    'Facebook',
    'Youtube',
    'Instagram',
  ];

  String? nameError;
  String? dobError;
  String? phoneError;
  String? emailError;
  String? ticketError;

  void validateName(String value) {
    setState(() {
      nameError = RegExp(r'[0-9]').hasMatch(value)
          ? 'Name cannot contain numbers'
          : null;
    });
  }

  void validateDOB(String value) {
    setState(() {
      final dobRegex = RegExp(r'^([0-2][0-9]|(3)[0-1])/(0[1-9]|1[0-2])/\d{4}$');
      if (!dobRegex.hasMatch(value)) {
        dobError = 'Enter a valid DOB in dd/MM/yyyy format';
      } else {
        try {
          final parts = value.split('/');
          final day = int.parse(parts[0]);
          final month = int.parse(parts[1]);
          final year = int.parse(parts[2]);
          final dob = DateTime(year, month, day);
          if (dob.isAfter(DateTime.now())) {
            dobError = 'DOB cannot be in the future';
          } else {
            dobError = null;
          }
        } catch (e) {
          dobError = 'Invalid date. Please try again.';
        }
      }
    });
  }

  void validatePhoneNumber(String value) {
    setState(() {
      if (!value.startsWith('03')) {
        phoneError = 'Phone number must start with "03"';
      } else if (value.length != 11) {
        phoneError = 'Phone number must be exactly 11 digits';
      } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
        phoneError = 'Phone number must contain only numbers';
      } else {
        phoneError = null;
      }
    });
  }

  void validateEmail(String value) {
    setState(() {
      if (!value.contains('@')) {
        emailError = 'Email must contain "@"';
      } else if (!value.endsWith('@gmail.com')) {
        emailError = 'Email must end with "@gmail.com"';
      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(value)) {
        emailError = 'Please enter a valid email address';
      } else {
        emailError = null;
      }
    });
  }

  void validateTicket(String value) {
    setState(() {
      final ticketRegex = RegExp(r'^\d+$');
      if (!ticketRegex.hasMatch(value)) {
        ticketError = 'Ticket number must contain only numbers';
      } else {
        ticketError = null;
      }
    });
  }

  void submitForm() {
    if (fullNameController.text.isEmpty ||
        dobController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        ticketController.text.isEmpty ||
        selectedGender == null ||
        selectedPayment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        body:Row(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Event Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    const EventDetailsRow(
                        label: 'Event Name', value: 'Social Media Creative'),
                    const EventDetailsRow(
                        label: 'Date', value: 'August 29, 2030'),
                    const EventDetailsRow(
                        label: 'Time', value: '1:00 PM - 3:00 PM'),
                    const SizedBox(height: 16),
                    const Text(
                      'Participant Information',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    FormInputField(
                      label: 'Full Name',
                      controller: fullNameController,
                      errorText: nameError,
                      onChanged: validateName,
                    ),
                    FormInputField(
                      label: 'Date of Birth',
                      controller: dobController,
                      errorText: dobError,
                      onChanged: validateDOB,
                    ),
                    FormRadioButtons(
                      label: 'Gender',
                      options: const ['Male', 'Female'],
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    FormInputField(
                      label: 'Phone Number',
                      controller: phoneController,
                      errorText: phoneError,
                      onChanged: validatePhoneNumber,
                    ),
                    FormInputField(
                      label: 'Email',
                      controller: emailController,
                      errorText: emailError,
                      onChanged: validateEmail,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormCheckBoxGroup(
                      label:
                      'Where did you hear about this virtual event?',
                      options: socialMediaOptions,
                      values: socialMediaSelections,
                      onChanged: (index, value) {
                        setState(() {
                          socialMediaSelections[index] = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Payment Information',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    FormInputField(
                      label: 'Number of Tickets',
                      controller: ticketController,
                      errorText: ticketError,
                      onChanged: validateTicket,
                    ),
                    FormRadioButtons(
                      label: 'Payment Method',
                      options: const ['Credit Card', 'Debit Card', 'Cash'],
                      groupValue: selectedPayment,
                      onChanged: (value) {
                        setState(() {
                          selectedPayment = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: submitForm,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      
      );
  }
}
