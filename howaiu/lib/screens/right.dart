import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:howaiu/screens/login.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  bool valNotify1 = false;

  OnChangedFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5d7599),
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 30,
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              )),
          Positioned(
            left: 23,
            top: 120,
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                depth: -5,
                color: Color(0xff5d7599),
              ),
              child: Container(
                width: 365,
                height: 650,
                decoration: BoxDecoration(
                    color: Color(0xff5d7599),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Container(
                          height: 65,
                          width: 65,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC4C4C4),
                            border: Border.all(
                              color: const Color(0xFFabb6c8),
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      Text(
                        'Garfield Greg V. Lim',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildAccountOption(context, 'Edit Profile'),
                  buildAccountOption(context, 'Change Password'),
                  buildAccountOption(context, 'Content Settings'),
                  buildAccountOption(context, 'Friends'),
                  buildAccountOption(context, 'Privacy and Security'),
                  buildNotificationOption(
                      'Push Notifications', valNotify1, OnChangedFunction1),
                  buildAccountOption(
                    context,
                    'Logout',
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangedMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Transform.scale(
            scale: 1,
            child: CupertinoSwitch(
              activeColor: Colors.green,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangedMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff4B4B4B),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildAccountOption(BuildContext context, String title,
    {bool isLogout = false}) {
  return GestureDetector(
    onTap: () {
      if (isLogout) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false,
        );
      }
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: isLogout ? Colors.red : Color(0xff4B4B4B),
          ),
        ],
      ),
    ),
  );
}
