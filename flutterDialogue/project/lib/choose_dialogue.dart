import 'package:flutter/material.dart';

class LanguageDialog extends StatefulWidget {
  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  String? _selectedLanguage = ''; // Default selected option

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 300,
      child: AlertDialog(
        title: const Text(
          'Choose your favourite programming language',
          style: TextStyle(fontSize: 15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text(
                'Dart',
                style: TextStyle(fontSize: 15),
              ),
              value: 'Dart',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text(
                'Java',
                style: TextStyle(fontSize: 15),
              ),
              value: 'Java',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text(
                'Python',
                style: TextStyle(fontSize: 15),
              ),
              value: 'Python',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Selected Language: $_selectedLanguage'),
                ),
              );
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
