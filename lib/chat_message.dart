import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;

  const ChatMessage(
    this.txt, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.amberAccent,
            child: Text("test"),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "ID ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(txt),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
