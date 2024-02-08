import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;
  final Animation<double> animation;
  const ChatMessage(
    this.txt, {
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      // 애니메이션을 위한 각종 Transition 중 하나를 선택
      child: FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
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
        ),
      ),
    );
  }
}
