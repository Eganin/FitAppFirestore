import 'package:firestore_test/ui/pages/auth.dart';
import 'package:firestore_test/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
