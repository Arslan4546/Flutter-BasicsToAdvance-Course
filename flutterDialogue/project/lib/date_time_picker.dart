import 'package:flutter/material.dart';

class DateTimePickerExample extends StatefulWidget {
  @override
  _DateTimePickerExampleState createState() => _DateTimePickerExampleState();
}

class _DateTimePickerExampleState extends State<DateTimePickerExample> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  String _formatDateTime() {
    if (selectedDate == null || selectedTime == null) {
      return 'No date and time selected';
    }
    final date =
        "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
    final time = "${selectedTime!.hour}:${selectedTime!.minute}";
    return "$date at $time";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 250, // Adjusted width for better layout
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatDateTime(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Subtle color for the text
            ),
            textAlign: TextAlign.center, // Center-align text for neatness
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickDate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Button background color
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              shadowColor: Colors.black38, // Add a shadow for a raised effect
              elevation: 5, // Elevation for a nice shadow effect
            ),
            child: const Text(
              'Pick Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 15), // Spacing between buttons
          ElevatedButton(
            onPressed: _pickTime,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent, // Different button color
              foregroundColor: Colors.black, // Text color for contrast
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              shadowColor: Colors.black38, // Add a shadow for a raised effect
              elevation: 5, // Elevation for a nice shadow effect
            ),
            child: const Text(
              'Pick Time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
