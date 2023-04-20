import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:howaiu/screens/chat.dart';
import 'package:table_calendar/table_calendar.dart';
import 'diary.dart';
import 'left.dart';
import 'calendar.dart';
import 'right.dart';

class TableCalendarExample extends StatefulWidget {
  @override
  _TableCalendarExampleState createState() => _TableCalendarExampleState();
}

class _TableCalendarExampleState extends State<TableCalendarExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xffdadada);
    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor,
        body: PageView(
          children: [
            LeftPage(),
            TableCalendarPage(),
            Settings(),
          ],
        ),
      ),
    );
  }
}
