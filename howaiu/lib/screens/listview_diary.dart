import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DiaryEntriesPage extends StatefulWidget {
  @override
  _DiaryEntriesPageState createState() => _DiaryEntriesPageState();
}

class DiaryEntry {
  final String title;
  final String content;
  final DateTime date;

  DiaryEntry({required this.title, required this.content, required this.date});
}

class _DiaryEntriesPageState extends State<DiaryEntriesPage> {
  List<DiaryEntry> diaryEntries = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void addDiaryEntry() {
    setState(() {
      diaryEntries.add(
        DiaryEntry(
          title: titleController.text,
          content: contentController.text,
          date: DateTime.now(),
        ),
      );
      titleController.clear();
      contentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xffdadada);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "How was your day?",
              style: TextStyle(fontSize: 34),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: "Write your thoughts...",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            NeumorphicButton(
              onPressed: addDiaryEntry,
              style: NeumorphicStyle(
                color: baseColor, // Set the button's background color
                depth: 5, // Set the depth of the button's shadow
                shape: NeumorphicShape.convex,
              ),
              child: Center(
                child: Text(
                  'Add Entry', // Set the text of the button
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:
                          Color(0xff5d7599)), // Set the font size of the text
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: diaryEntries.length,
                itemBuilder: (context, index) {
                  final entry = diaryEntries[index];
                  return ListTile(
                    title: Text(entry.title),
                    subtitle: Text(entry.content),
                    trailing:
                        Text(DateFormat('MM/dd/yyyy HH:mm').format(entry.date)),
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
