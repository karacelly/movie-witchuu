import 'package:flutter/material.dart';
import 'package:movie_witchuu/pages/homepage/homepage.dart';
import 'package:movie_witchuu/pages/itempage/moviepage.dart';
import 'Pages/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
  // This widget is the root of your application.

}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movie witchuu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        "/homepage": (_) => new HomePage(),
        "/logout": (_) => new LoginScreen(),
        "/movies": (_) => new MoviePage(),
      },
    );
  }
}
