import 'package:flutter/material.dart';

class BottomSheetContent extends StatefulWidget {
  final String imageUrl;
  final String title;

  const BottomSheetContent({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<String> messages = []; // Store messages

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add(_messageController.text); // Add new message at the bottom
        _messageController.clear(); // Clear input field
      });

      // Scroll to the latest message
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        // Profile Info & Icons
        Row(
          children: [
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            const Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.video_call),
                  Icon(Icons.call),
                  Icon(Icons.more_vert),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Chat Messages List
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Align(
                  alignment: Alignment.centerLeft, // Align messages to the left
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width *
                          0.75, // Limit width
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      messages[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Message Input Field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    controller: _messageController,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (value) =>
                        _sendMessage(), // Send on Enter
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: Icon(Icons.camera_alt_rounded),
                      prefixIcon: Icon(Icons.message),
                      hintText: "Message",
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: _sendMessage, // Send message on tap
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
