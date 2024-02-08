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

  final List<String> _chats = [];
  //애니메이티드 리스트 사용하기위해 필요, 이 키로 언제 어떤 애니를 줄지 컨트롤함
  final GlobalKey<AnimatedListState> _animListKey =
      GlobalKey<AnimatedListState>();

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
            child: AnimatedList(
              key: _animListKey,
              itemBuilder: _buildItem,
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

  Widget _buildItem(context, index, animation) {
    //animation은 변화하는 값을 넣어주는 것임, 기본값 0.3
    return ChatMessage(_chats[index], animation: animation);
  }

  void _handleSubmitted(String text) {
    Logger().d(text);
    _chats.insert(0, text);
    _textEditingController.clear();
    // 애니메이션한테 0번쨰 아이템이 새로 생성되었다고 알림
    _animListKey.currentState!.insertItem(0);
  }
}
