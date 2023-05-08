import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:howaiu/screens/chat.dart';

class FeedbackPage extends StatefulWidget {
  final String entry;
  final List<String> previousEntries;

  FeedbackPage({required this.entry, required this.previousEntries});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String feedback = '';

  @override
  void initState() {
    super.initState();
    getFeedback();
  }

  Future<void> getFeedback() async {
    await processRequest('feedback', widget.entry, (String value) {
      setState(() {
        feedback = value;
      });
    });
  }

  Future<void> processRequest(
      String route, String entry, Function(String) callback) async {
    // Mock response
    Future.delayed(Duration(seconds: 1), () {
      callback('Mock response for $route');
    });
  }

  PageRouteBuilder _createCustomPageRoute(Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffabb6c8),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              if (feedback != '')
                SizedBox(
                  width: 350,
                  height: 450,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -5,
                      intensity: 1,
                      shape: NeumorphicShape.convex,
                      color: Color(0xffabb6c8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        feedback,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              Row(
                children: [
                  SizedBox(
                    width: 315,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context, _createCustomPageRoute(ChatAiu()));
                      },
                      child: Text("Aiu"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
