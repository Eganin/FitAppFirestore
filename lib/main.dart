import 'package:firestore_test/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FitApp());
}

class FitApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(
          50,
          65,
          85,
          1,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
