import 'package:flutter/material.dart';
import 'package:movie_witchuu/models/user.dart';
import 'package:movie_witchuu/utils/global.dart' as globals;

import 'components/background.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginScreen> {
  var _ctrlUsername = TextEditingController();
  var _ctrlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  static final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
  static final capitalchar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  static var userDB = [
    User('admin', 'Admin123'),
    User('kesya', 'Lalala123'),
    User('amanda', 'Lalala123'),
  ];

  void _onPressed(BuildContext ctx) {
    if (_formKey.currentState!.validate()) {
      bool found = false;
      for (var user in userDB) {
        if (_ctrlUsername.text == user.username &&
            _ctrlPassword.text == user.password) {
          found = true;
          globals.current = user;
          Navigator.pushReplacementNamed(ctx, '/homepage');
        }
        Future.delayed(const Duration(seconds: 5));
      }

      if (found == false) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            content: Text('Oops! Wrong credentials!'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Background(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.13),
                      Container(
                        child: Image(
                          image: AssetImage(
                            'assets/images/logo.png',
                          ),
                          width: size.width * 0.35,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: size.height * 0.04),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: TextFormField(
                                controller: _ctrlUsername,
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle:
                                      new TextStyle(color: Colors.grey[800]),
                                  fillColor: Color(0xffe8e4db),
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Username can't be empty!";
                                  }
                                  return null;
                                },
                                style: TextStyle(height: 1),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: TextFormField(
                                controller: _ctrlPassword,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle:
                                      new TextStyle(color: Colors.grey[800]),
                                  fillColor: Color(0xffe8e4db),
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Password can't be empty!";
                                  } else if (text.length < 8) {
                                    return "Password must be minimum 8 characters!";
                                  } else if (!alphanumeric.hasMatch(text)) {
                                    return "Password must be alphanumeric!";
                                  } else if (!capitalchar
                                      .contains('${text[0]}')) {
                                    return "Password must at least have 1 uppercase character!";
                                  }
                                  return null;
                                },
                                style: TextStyle(height: 1),
                                obscureText: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xffc8894d)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    height: 50, width: size.width * 0.9),
                                child: ElevatedButton(
                                  onPressed: () => _onPressed(context),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Color(0xfffaab60),
                                    ),
                                  ),
                                  child: Text("Login".toUpperCase(),
                                      style: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: Text(
                                "Don't Have an Account? Sign up",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffc8894d),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
