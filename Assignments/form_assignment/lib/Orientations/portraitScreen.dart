import 'package:flutter/material.dart';

import '../components/event_details_row.dart';
import '../components/form_check_box_group.dart';
import '../components/form_input_field.dart';
import '../components/form_radio_buttons.dart';

class PortraitScreen extends StatefulWidget {
  const PortraitScreen({super.key});

  @override
  _PortraitScreenState createState() =>
      _PortraitScreenState();
}

class _PortraitScreenState extends State<PortraitScreen> {
  // State variables
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ticketController = TextEditingController();

  String? selectedGender;
  String? selectedPayment;
  List<bool> socialMediaSelections = [false, false, false, false, false];

  final List<String> socialMediaOptions = [
    'Facebook',
    'Youtube',
    'Instagram',
  ];





  void submitForm() {
    // Trigger validation
    if (fullNameController.text.isEmpty ||
        ticketController.text.isEmpty ||
        dobController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
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



  String? nameError; // Store the error message dynamically
  String? dobError;// Store the error message dynamically
  String? phoneError;// Store the error message dynamically
  String? emailError;// Store the error message dynamically
  String? ticketError;// Store the error message dynamically

  // Method for checking Name Field
  validateName(String value) {
    setState(() {
      // Check if the input contains numbers
      nameError = RegExp(r'[0-9]').hasMatch(value)
          ? 'Name cannot contain numbers'
          : null;
    });
  }

  // Method for Checking DOB Field
  validateDOB(String value) {
    setState(() {
      // Regular expression for validating DOB in dd/MM/yyyy format
      final dobRegex = RegExp(r'^([0-2][0-9]|(3)[0-1])/(0[1-9]|1[0-2])/\d{4}$');

      // Check if input matches the regex
      if (!dobRegex.hasMatch(value)) {
        dobError = 'Enter a valid DOB in dd/MM/yyyy format';
      } else {
        // Optional: Check if the entered date is in the past
        try {
          final parts = value.split('/');
          final day = int.parse(parts[0]);
          final month = int.parse(parts[1]);
          final year = int.parse(parts[2]);
          final dob = DateTime(year, month, day);

          if (dob.isAfter(DateTime.now())) {
            dobError = 'DOB cannot be in the future';
          } else {
            dobError = null; // No error if valid
          }
        } catch (e) {
          dobError = 'Invalid date. Please try again.';
        }
      }
    });
  }
  // Method for Checking Phone Field

  validatePhoneNumber(String value) {
    setState(() {
      // Check if the phone number starts with "03"
      if (!value.startsWith('03')) {
        phoneError = 'Phone number must start with "03"';
      }
      // Check if the length exceeds 11 digits
      else if (value.length > 11) {
        phoneError = 'Phone number cannot exceed 11 digits';
      }
      // Check if the length is less than 11 digits
      else if (value.length < 11) {
        phoneError = 'Phone number must be exactly 11 digits';
      }
      // Check if the phone number contains only digits
      else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
        phoneError = 'Phone number must contain only numbers';
      }
      else {
        phoneError = null; // No error if all conditions are valid
      }
    });
  }
  validateEmail(String value) {
    setState(() {
      // Check if the email contains "@"
      if (!value.contains('@')) {
        emailError = 'Email must contain "@"';
      }
      // Check if the email contains "@gmail.com"
      else if (!value.endsWith('@gmail.com')) {
        emailError = 'Email must end with "@gmail.com"';
      }
      // Check if the email contains invalid characters or is an empty string
      else if (value.isEmpty || !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
        emailError = 'Please enter a valid email address';
      }
      else {
        emailError = null; // No error if all conditions are valid
      }
    });
  }

  validateTicket(String value) {
    setState(() {
      // Check if the input contains only numbers
      final ticketRegex = RegExp(r'^\d+$'); // Only numbers allowed
      if (!ticketRegex.hasMatch(value)) {
        ticketError = 'Ticket number must contain only numbers';
      }
      // You can add other validations for length or specific conditions if necessary
      else {
        ticketError = null; // No error if valid
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Size(:height, :width) = size;
    final clientSide = height-kToolbarHeight;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:const Text( "Registration Form",style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Details Section
            Container(
              width: double.infinity,
              padding:  EdgeInsets.all(width*0.03),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                  ),
                ],
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventDetailsRow(label: 'Event Name', value: 'Qwali Night'),
                  EventDetailsRow(label: 'Date', value: 'December 30, 2024'),
                  EventDetailsRow(label: 'Time', value: '7:00 PM - 10:00 PM'),

                ],
              ),
            ),
            SizedBox(height: clientSide*0.016),

            // Participant Information
             Text(
              'Participant Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: width*0.04),
            ),

            FormInputField(
              label: 'Full Name',
              controller: fullNameController,
              errorText: nameError, // Pass dynamic error message
              onChanged: validateName, //
            ),
            FormInputField(
              label: 'Date Of Birth',
              controller: dobController,
              errorText: dobError, // Pass dynamic error message
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
              errorText: phoneError, // Pass dynamic error message
              onChanged: validatePhoneNumber,

            ),
            FormInputField(
              label: 'Email',
              controller: emailController,
              errorText: emailError, // Pass dynamic error message
              onChanged:validateEmail,
            ),
            FormCheckBoxGroup(
              label: 'Where did you hear about this virtual event?',
              options: socialMediaOptions,
              values: socialMediaSelections,
              onChanged: (index, value) {
                setState(() {
                  socialMediaSelections[index] = value;
                });
              },
            ),



            // Payment Information
             Text(
              'Payment Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: width*0.04),
            ),

            FormInputField(
              label: 'Number of Tickets',
              controller: ticketController,
              errorText: ticketError, // Pass dynamic error message
              onChanged:validateTicket,
            ),
            FormRadioButtons(
              label: 'Payment Method',
              options: const ['Credit Card', 'Debit Card',"Cash"],
              groupValue: selectedPayment,
              onChanged: (value) {
                setState(() {
                  selectedPayment = value;
                });
              },
            ),


            // Disclaimer and Signature

            SizedBox(height: clientSide*0.011),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onHover: (value) {
                    // You can change the button appearance on hover here
                    // For example, changing the background color on hover
                    setState(() {
                      // Optionally update state for hover effect
                    });
                  },
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38), disabledBackgroundColor: Colors.grey.withOpacity(0.12), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                    padding:  EdgeInsets.symmetric( horizontal: width*0.03), // Padding for the button
                    elevation: 5, // Color when the button is disabled
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18, // Text size
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
