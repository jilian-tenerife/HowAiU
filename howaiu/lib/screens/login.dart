import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:howaiu/screens/forgotpass.dart';
import 'package:howaiu/screens/home_page.dart';
import 'package:howaiu/screens/signup.dart';

import '../main.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Color(0xffdadada);

    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'howaiu?',
                    style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5d7599)),
                  ),
                ],
              ),
              const SizedBox(
                height: 95,
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                  width: 300,
                  height: 60,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        depth: -3,
                        shape: NeumorphicShape.concave,
                        color: baseColor),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffabb6c8)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: const TextStyle(
                            color: Color(0xff5d7599),
                          ),
                          filled: true,
                          fillColor: baseColor,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: 300,
                  height: 60,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        depth: -3,
                        shape: NeumorphicShape.flat,
                        color: baseColor),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5d7599)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xff5d7599),
                          ),
                          filled: true,
                          fillColor: baseColor,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xff5d7599),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff5d7599)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => forgotPassword()));
                    },
                  ),
                  SizedBox(
                    width: 60,
                  )
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                width: 250,
                height: 60,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      depth: 5,
                      shape: NeumorphicShape.concave,
                      lightSource: LightSource.topLeft,
                      intensity: 0.7,
                      color: baseColor),
                  child: NeumorphicButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: NeumorphicStyle(
                      color: baseColor, // Set the button's background color
                      depth: 5, // Set the depth of the button's shadow
                      shape: NeumorphicShape.convex,
                    ),
                    child: Center(
                      child: Text(
                        'Log In', // Set the text of the button
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(
                                0xff5d7599)), // Set the font size of the text
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              InkWell(
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                      color: Color(0xff5d7599),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff5d7599)),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
