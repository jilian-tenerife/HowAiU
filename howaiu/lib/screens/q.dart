import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:howaiu/screens/home_page.dart';

import 'left.dart';
import 'right.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xffdadada);

    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor,
        body: PageView(
          children: [
            LeftPage(),
            TableCalendarExample(), // Your existing page
            RightPage(),
          ],
        ),
      ),
    );
  }
}
