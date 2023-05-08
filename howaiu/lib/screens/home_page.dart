import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:table_calendar/table_calendar.dart';
>>>>>>> Stashed changes
import 'left.dart';
import 'calendar.dart';
import 'right.dart';

class TableCalendarExample extends StatefulWidget {
  @override
  _TableCalendarExampleState createState() => _TableCalendarExampleState();
}

class _TableCalendarExampleState extends State<TableCalendarExample> {
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xffdadada);
    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor,
        body: PageView(
          controller: _pageController, // Add a controller for navigation
          physics: NeverScrollableScrollPhysics(), // Disable swipe navigation
          children: [
            LeftPage(),
            TableCalendarPage(),
            Settings(),
          ],
          onPageChanged: (int index) {
            // Handle page change
          },
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
