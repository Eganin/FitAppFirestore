import 'package:firestore_test/ui/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';
import 'services/auth.dart';

void main() {
  runApp(FitApp());
}

class FitApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserApp>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
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
        home: LandingPage(),
      ),
    );
  }
}
