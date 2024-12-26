import 'package:flutter/material.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int selectedStars = 0; // Track the selected number of stars
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        const Text(
          "Rate Us",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        // Star Rating Section (Manually created icons)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectedStars = 1; // Update the selected stars
                });
              },
              icon: Icon(
                Icons.star,
                size: 30,
                color: selectedStars >= 1
                    ? Colors.green
                    : Colors.grey.shade300, // Highlight selected stars
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedStars = 2; // Update the selected stars
                });
              },
              icon: Icon(
                Icons.star,
                size: 30,
                color: selectedStars >= 2
                    ? Colors.green
                    : Colors.grey.shade300, // Highlight selected stars
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedStars = 3; // Update the selected stars
                });
              },
              icon: Icon(
                Icons.star,
                size: 30,
                color: selectedStars >= 3
                    ? Colors.green
                    : Colors.grey.shade300, // Highlight selected stars
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedStars = 4; // Update the selected stars
                });
              },
              icon: Icon(
                Icons.star,
                size: 30,
                color: selectedStars >= 4
                    ? Colors.green
                    : Colors.grey.shade300, // Highlight selected stars
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedStars = 5; // Update the selected stars
                });
              },
              icon: Icon(
                Icons.star,
                size: 30,
                color: selectedStars >= 5
                    ? Colors.green
                    : Colors.grey.shade300, // Highlight selected stars
              ),
            ),
          ],
        ),
        // Text Field for Review
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: reviewController,
            decoration: InputDecoration(
              hintText: "Add review",
              hintStyle: TextStyle(color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.all(12.0),
            ),
            maxLines: 3, // Allow multiline text input
          ),
        ),
        const SizedBox(height: 16),
        // Button to Submit Rating
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "You rated $selectedStars stars with review: ${reviewController.text}",
                  ),
                ),
              );
            },
            child: const Text(
              "Rate product",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
