import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';

class FeedbackScreen extends StatefulWidget {
  final String entry;
  final List<String> previousEntries;

  FeedbackScreen({required this.entry, required this.previousEntries});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String title = '';
  String feedback = '';
  String analysis = '';
  String contextualResponse = '';

  @override
  void initState() {
    super.initState();
    generateTitle();
  }

  Future<void> generateTitle() async {
    await processRequest('title', widget.entry, (String value) {
      setState(() {
        title = value;
      });
    });
  }

  Future<void> processRequest(
      String route, String entry, Function(String) callback) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/$route'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'entry': entry}),
    );

    if (response.statusCode == 200) {
      callback(jsonDecode(response.body)[route]);
    } else {
      callback('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    title,
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: false, // Set this to false
                totalRepeatCount:
                    1, // Set this to 1 to play the animation only once
              )),
            ),
            NeumorphicButton(
              onPressed: () async {
                await processRequest('feedback', widget.entry, (String value) {
                  setState(() {
                    feedback = value;
                  });
                });
              },
              child: Text('Get Feedback'),
            ),
            if (feedback != '')
              (AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    feedback,
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                repeatForever: false, // Set this to false
                totalRepeatCount:
                    1, // Set this to 1 to play the animation only once
              )),
            //Text(feedback),
            NeumorphicButton(
              onPressed: () async {
                await processRequest('analytical_response', widget.entry,
                    (String value) {
                  setState(() {
                    analysis = value;
                  });
                });
              },
              child: Text('Get Analytical Response'),
            ),
            if (analysis != '')
              (AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    analysis,
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                repeatForever: false, // Set this to false
                totalRepeatCount:
                    1, // Set this to 1 to play the animation only once
              )),
            //Text(analysis),
            NeumorphicButton(
              onPressed: () async {
                final allEntries = widget.previousEntries + [widget.entry];
                await processRequest(
                    'contextual_response', allEntries.join('\n'),
                    (String value) {
                  setState(() {
                    contextualResponse = value;
                  });
                });
              },
              child: Text('Get Contextual Response'),
            ),
            if (contextualResponse != '')
              (AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    contextualResponse,
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                repeatForever: false, // Set this to false
                totalRepeatCount:
                    1, // Set this to 1 to play the animation only once
              )),
            //Text(contextualResponse),
          ],
        ),
      ),
    );
  }
}
