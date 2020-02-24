import 'package:blackflag_github_flutter/page/home_page.dart';
import 'package:blackflag_github_flutter/page/login_page.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  static pushReplacementNamed(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  static pushNamed(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

  static goLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }
}
