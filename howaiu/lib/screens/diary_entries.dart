import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'feedback_screen.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<String> entries = [];
  TextEditingController entryController = TextEditingController();

  String _result = '';

  Future<void> processRequest(String route) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/$route'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'entry': entryController.text}),
    );

    if (response.statusCode == 200) {
      setState(() {
        _result = jsonDecode(response.body)[route];
      });
    } else {
      setState(() {
        _result = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Diary'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: entryController,
              decoration: const InputDecoration(
                labelText: 'Enter diary entry',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                entries.insert(
                    0,
                    entryController
                        .text); // add new entry to the beginning of the list
                entryController.clear();
              });
            },
            child: Text('Add Entry'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(entries[index]),
                  // in the ListView.builder
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Call API and functions here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackScreen(
                            entry: entries[index],
                            previousEntries: entries.sublist(index + 1),
                          ),
                        ),
                      );
                    },
                    child: Text('Feedback'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
