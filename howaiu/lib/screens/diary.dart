import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:howaiu/screens/aiu.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your diary entry here...',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: OpenContainer(
          openColor: Colors.blueGrey[100]!,
          transitionDuration: Duration(seconds: 2),
          transitionType: ContainerTransitionType.fadeThrough,
          closedBuilder: (context, action) => Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.amberAccent),
                child: Icon(Icons.chat_bubble_outline_rounded),
              ),
          openBuilder: (context, action) => Aiu()),
    );
  }
}
