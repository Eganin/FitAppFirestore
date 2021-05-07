import 'package:firestore_test/domain/user.dart';
import 'package:firestore_test/ui/pages/auth.dart';
import 'package:firestore_test/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserApp user = Provider.of<UserApp>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
