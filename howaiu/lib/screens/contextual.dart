import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ContextualFeedbackPage extends StatefulWidget {
  final String entry;
  final List<String> previousEntries;

  ContextualFeedbackPage({required this.entry, required this.previousEntries});

  @override
  _ContextualFeedbackPageState createState() => _ContextualFeedbackPageState();
}

class _ContextualFeedbackPageState extends State<ContextualFeedbackPage> {
  String contextualResponse = '';

  @override
  void initState() {
    super.initState();
    getContextualFeedback();
  }

  Future<void> getContextualFeedback() async {
    await processRequest('contextual_response', widget.entry, (String value) {
      setState(() {
        contextualResponse = value;
      });
    });
  }

  Future<void> processRequest(
      String route, String entry, Function(String) callback) async {
    // Uncomment the following lines and replace with your server logic
    // final response = await http.post(
    //   Uri.parse('http://10.0.2.2:5000/$route'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({'entry': entry}),
    // );

    // if (response.statusCode == 200) {
    //   callback(jsonDecode(response.body)[route]);
    // } else {
    //   callback('Error: ${response.statusCode}');
    // }

    // Mock response
    Future.delayed(Duration(seconds: 1), () {
      callback('Mock response for $route');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffabb6c8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            if (contextualResponse != '')
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
                      contextualResponse,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
