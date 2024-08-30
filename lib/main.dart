import 'package:flutter/material.dart';
//import 'package:polling_app/screens/poll_list_page.dart';
import 'package:polling_app/screens/poll_page.dart';

void main() {
  runApp(const PollingApp());
}

class PollingApp extends StatelessWidget {
  const PollingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PollPage(),
      theme: ThemeData(primaryColor: Colors.green),
    );
  }
}
