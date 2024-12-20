import 'package:flutter/material.dart';
import 'components/form_input_field.dart';
import 'components/form_radio_buttons.dart';
import 'components/form_check_box_group.dart';
import 'components/form_payment_section.dart';
import 'components/event_details_row.dart';

void main() {
  runApp(EventRegistrationApp());
}

class EventRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventRegistrationScreen(),
    );
  }
}

class EventRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Registration Form'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Details Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About This Event',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  EventDetailsRow(label: 'Event Name', value: 'Social Media Creative'),
                  EventDetailsRow(label: 'Date', value: 'August 29, 2030'),
                  EventDetailsRow(label: 'Time', value: '1:00 PM - 3:00 PM'),
                  EventDetailsRow(label: 'Speaker',
                      value: 'Michelle Erica (Social Media Specialist)'),
                  EventDetailsRow(label: 'Organizer', value: 'Creative Event'),
                  EventDetailsRow(label: 'More Information',
                      value: 'www.creativeevent.com'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Participant Information
            const Text(
              'Participant Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            FormInputField(label: 'Full Name'),
            FormInputField(label: 'Date of Birth'),
            FormRadioButtons(label: 'Gender', options: ['Male', 'Female']),
            FormInputField(label: 'Phone Number'),
            FormInputField(label: 'Email'),
            FormCheckBoxGroup(
              label: 'Where did you hear about this virtual event?',
              options: ['Facebook', 'Youtube', 'Instagram', 'Twitter', 'Other'],
            ),

            const SizedBox(height: 16),

            // Payment Information
            const Text(
              'Payment Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            FormInputField(label: 'Number of Tickets'),
            FormPaymentSection(),

            const SizedBox(height: 24),

            // Disclaimer and Signature
            Text(
              'I understand that participation in this event may involve '
                  'some degree of risk. I release WebinarPros LLC from any liability '
                  'for injury, loss, or damage to personal property.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date: August 29, 2030', style: TextStyle(fontSize: 14)),
                Column(
                  children: [
                    Container(
                      width: screenWidth * 0.4,
                      height: 1,
                      color: Colors.grey,
                    ),
                    const Text('James John'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
