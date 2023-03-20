import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Diary extends StatelessWidget {
  const Diary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5D7599),
      body: Center(
          child: Column(
        children: [
          Text(
            'Hello, World!',
            style: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
