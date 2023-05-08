import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:howaiu/screens/forgotpass.dart';
import 'package:howaiu/screens/home_page.dart';
import 'package:howaiu/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/howaiu.png'),
                        fit: BoxFit
                            .cover, // Specify how the image should be fitted inside the box
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 95,
              // ),
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
                        controller: _emailController,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffabb6c8)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
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
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(
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
                      style: TextStyle(
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
                    onPressed: () async {
                      try {
                        final UserCredential userCredential =
                            await _auth.signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text);
                        if (userCredential.user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TableCalendarExample()),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    style: NeumorphicStyle(
                      color: baseColor, // Set the button's background color
                      depth: 5, // Set the depth of the button's shadow
                      shape: NeumorphicShape.convex,
                    ),
                    child: Center(
                      child: Text(
                        'Log In', // Set the text of the button
                        style: TextStyle(
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
                  style: TextStyle(
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
