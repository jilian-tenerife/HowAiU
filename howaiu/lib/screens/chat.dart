import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
      text: 'How can I help you bitch lasagna?',
      isCurrentUser: false,
    ),
  ];

  Future<String> _sendMessage(String message, String name) async {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(ChatBubble(text: text, isCurrentUser: true));
      });
      _controller.clear();
    }

    final response = await http.post(
      Uri.parse('http://10.0.2.2:5001/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message, 'name': name}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['response'];
    } else {
      throw Exception('Failed to load chatbot response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat AIU'),
        backgroundColor: Colors.grey[300],
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    String message = _controller.text;
                    String response = await _sendMessage(message, 'JiwJiw');
                    setState(() {
                      _messages.add(
                          ChatBubble(text: response, isCurrentUser: false));
                    });
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
