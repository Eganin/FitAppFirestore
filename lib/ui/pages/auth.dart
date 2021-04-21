import 'package:firestore_test/domain/user.dart';
import 'package:firestore_test/services/auth.dart';
import 'package:firestore_test/ui/widgets/auth/logo.dart';
import 'package:firestore_test/ui/widgets/auth/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          logo(),
          SizedBox(
            height: 80,
          ),
          showLogin
              ? _form(
                  context: context,
                  label: 'Login',
                  onClick: _loginButtonAction,
                  textAuthorization: 'Not registered yet? Register!',
                )
              : _form(
                  context: context,
                  label: 'Registered',
                  onClick: _registerButtonAction,
                  textAuthorization: 'Already registered? Login!',
                ),
          _bottomWave(),
        ],
      ),
    );
  }

  void _loginButtonAction() async {
    print('_________');
    Fluttertoast.showToast(
      msg: "YES",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_email.isEmpty || _password.isEmpty) return;

    UserApp user = await _authService.signInWithEmailAndPassword(
        email: _email, password: _password);
    if (user == null) {
      Fluttertoast.showToast(
        msg: "Can't sing in you! Please check your password/email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }

  void _registerButtonAction() async {
    print('___________________');
    Fluttertoast.showToast(
      msg: "YES",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_email.isEmpty || _password.isEmpty) return;

    UserApp user = await _authService.registerWithEmailAndPassword(
        email: _email, password: _password);
    if (user == null) {
      Fluttertoast.showToast(
        msg: "Can't register in you! Please check your password/email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }

  Widget _bottomWave() {
    return Expanded(
      child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 300,
          ),
          clipper: BottomWaveClipper(),
        ),
      ),
    );
  }

  Widget _form(
      {BuildContext context,
      String label,
      String textAuthorization,
      void onClick()}) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                  top: 10,
                ),
                child: _input(
                  icon: Icon(Icons.email),
                  hint: 'Email',
                  controller: _emailController,
                  obscure: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                ),
                child: _input(
                  icon: Icon(Icons.lock),
                  hint: 'Password',
                  controller: _passwordController,
                  obscure: true,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: _button(
                    text: label,
                    onClick: onClick,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            child: Text(
              textAuthorization,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onTap: () {
              setState(() {
                showLogin = !showLogin;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _button({String text, void onClick()}) {
    return MaterialButton(
      onPressed: onClick,
      // цвет распространения
      splashColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _input({
    Icon icon,
    String hint,
    TextEditingController controller,
    bool obscure,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white30,
          ),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white54,
              width: 1,
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: IconTheme(
              data: IconThemeData(color: Colors.white),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
