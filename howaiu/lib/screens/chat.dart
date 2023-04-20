import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/chat_bubble.dart';

class ChatAiu extends StatefulWidget {
  const ChatAiu({Key? key}) : super(key: key);

  @override
  State<ChatAiu> createState() => _ChatAiuState();
}

class _ChatAiuState extends State<ChatAiu> {
  final TextEditingController _controller = TextEditingController();
  List<ChatBubble> _messages = [
    const ChatBubble(
      text: 'How can I help you?',
      isCurrentUser: false,
    ),
  ];

  void _sendMessage() {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(ChatBubble(text: text, isCurrentUser: true));
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xffdadada);

    return Scaffold(
      backgroundColor: Color(0xffabb6c8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: 10,
              shape: NeumorphicShape.concave,
              lightSource: LightSource.bottomLeft,
              color: baseColor,
            ),
            child: AppBar(
              backgroundColor: Color(0xffabb6c8),
              elevation: 10,
              title: const Text('AiU'),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: 4,
                      shape: NeumorphicShape.convex,
                      lightSource: LightSource.topLeft,
                      color: Color(0xffabb6c8),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                NeumorphicButton(
                  onPressed: _sendMessage,
                  child: Icon(
                    Icons.send,
                    color: Color(0xffabb6c8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
