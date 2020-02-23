import 'package:blackflag_github_flutter/common/dao/dao_result.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      //判断去登录还是主页
      Navigator.of(context).pushReplacementNamed("login_page");
    });

    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Welcome Page",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
    );
  }

  toNext(DataResult res) {
    String routeStr = "";
    if (res != null && res.result) {
      routeStr = "home_page";
    } else {
      routeStr = "login_page";
    }
    Navigator.of(context).pushReplacementNamed(routeStr);
  }
}
