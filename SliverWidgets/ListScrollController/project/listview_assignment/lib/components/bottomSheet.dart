import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  final String imageUrl;
  final String title;

  const BottomSheetContent({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
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
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
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
        const SizedBox(height: 390),
        Row(
          children: [
            const SizedBox(width: 4),
            Container(
              height: 50,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.camera_alt_rounded),
                  prefixIcon: Icon(Icons.message),
                  label: Text(
                    "Message",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: Colors.yellowAccent.shade400,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.multitrack_audio_rounded,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
