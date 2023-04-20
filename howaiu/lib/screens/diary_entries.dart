import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
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
    Color baseColor = const Color(0xffdadada);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffabb6c8),
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "How was your day?",
              style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff7f0c6)),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 350,
              height: 300,
              child: Neumorphic(
                style: NeumorphicStyle(
                  depth: -5,
                  intensity: 1,
                  shape: NeumorphicShape.concave,
                  color: Color(0xffabb6c8),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: TextField(
                    controller: entryController,
                    decoration: InputDecoration(
                      hintText: "Write your thoughts...",
                      hintStyle: TextStyle(
                        color: Color(0xff5d7599),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            NeumorphicButton(
              onPressed: () {
                setState(() {
                  entries.insert(
                      0,
                      entryController
                          .text); // add new entry to the beginning of the list
                  entryController.clear();
                });
              },
              style: NeumorphicStyle(
                color: Color(0xffabb6c8), // Set the button's background color
                depth: 5,
                shape: NeumorphicShape.flat,
              ),
              child: Text(
                'Add Entry',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5d7599)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(entries[index]),
                    // in the ListView.builder
                    trailing: NeumorphicButton(
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
                      style: NeumorphicStyle(
                        color: Color(
                            0xfff7f0c6), // Set the button's background color
                        depth: 5,
                        shape: NeumorphicShape.flat,
                      ),
                      child: Text(
                        'Feedback',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffabb6c8)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
