import 'package:chat_v1/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //텍스트필드의 값을 가져오는 컨트롤러
  final TextEditingController _textEditingController = TextEditingController();

  final List<ChatMessage> _chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatApp"),
      ),
      body: Column(
        children: [
          Expanded(
            // child: ListView(
            //   children: const [
            //     ChatMessage("message1"),
            //     ChatMessage("message2"),
            //   ],
            // ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _chats[index];
              },
              itemCount: _chats.length,
              reverse: true, // 메시지 아래가 최신것으로 보이는 방법
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration:
                        const InputDecoration(hintText: "write message.."),
                    //onSubmitted가 (String text){} 이렇게 되는데
                    //이게 함수의 구조와 맞으면 함수명으로만 전달가능
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                ElevatedButton(
                  // 온프레스드는 text인자가 없기때문에 아래처럼 씀
                  onPressed: () {
                    _handleSubmitted(_textEditingController.text);
                  },
                  child: const Text("send"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    Logger().d(text);

    setState(() {
      ChatMessage newChat = ChatMessage(text);
      // _chats.add(newChat); 이것을 쓰면 메시지가 반대로보임
      _chats.insert(0, newChat);
    });
    // 함수 실행 시 기존 글자 제거
    _textEditingController.clear();
  }
}
