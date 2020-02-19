import 'package:blackflag_github_flutter/page/home_page.dart';
import 'package:blackflag_github_flutter/page/login_page.dart';
import 'package:blackflag_github_flutter/page/welcom_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "welcome_page": (context) => WelcomePage(),
        "login_page": (context) => LoginPage(),
        "home_page": (context) => HomePage(),
      },
      home: WelcomePage(),
    );
  }
}
