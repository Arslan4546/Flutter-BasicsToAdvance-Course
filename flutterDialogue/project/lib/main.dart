import 'package:flutter/material.dart';
import 'package:project/LoginDialogue.dart';
import 'package:project/SimpleDialogue.dart';
import 'package:project/choose_dialogue.dart';
import 'package:project/date_time_picker.dart';
import 'package:project/rateUs_dialogue.dart';
import 'package:project/success_dialogue.dart';
import 'package:project/warning_dialogue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Optional: Removes the debug banner
      home: BUttonScreen(),
    );
  }
}

class BUttonScreen extends StatefulWidget {
  const BUttonScreen({super.key});

  @override
  State<BUttonScreen> createState() => _BUttonScreenState();
}

class _BUttonScreenState extends State<BUttonScreen> {
  void _SimpleDialogue() {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        elevation: 18,
        child: DialogBody(),
      ),
    );
  }

  void _LoginDialogue() {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        elevation: 18,
        child: MainDialogue(),
      ),
    );
  }

  void _WarningDialogue() {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        elevation: 18,
        child: WarningDialog(),
      ),
    );
  }

  void _RateUsDialogue() {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        elevation: 18,
        child: RatingDialog(),
      ),
    );
  }

  void _SucessDialogue() {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        elevation: 18,
        child: SucessDialog(),
      ),
    );
  }

  void _ChooseDialogue() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 18,
        child: LanguageDialog(),
      ),
    );
  }

  void _DateTimeDialogue() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 18,
        child: DateTimePickerExample(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth > 600 ? 200.0 : 100.0;

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Different Dialogue Box Examples",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            buildButton(
                context, 'Delete', Colors.red, buttonWidth, _SimpleDialogue),
            buildButton(
                context, 'Login', Colors.blue, buttonWidth, _LoginDialogue),
            buildButton(
                context, "Warning", Colors.red, buttonWidth, _WarningDialogue),
            buildButton(
                context, "Rate Us", Colors.green, buttonWidth, _RateUsDialogue),
            buildButton(
                context, "Success", Colors.green, buttonWidth, _SucessDialogue),
            buildButton(
                context, "Choose", Colors.green, buttonWidth, _ChooseDialogue),
            buildButton(context, "Picker", Colors.green, buttonWidth,
                _DateTimeDialogue),
          ],
        ),
      ),
    );
  }

  Widget buildButton(
    BuildContext context,
    String text,
    Color color,
    double width,
    VoidCallback onPressed, {
    Color textColor = Colors.white,
    Color borderColor = Colors.transparent,
  }) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(color: borderColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
