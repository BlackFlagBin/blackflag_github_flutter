import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:blackflag_github_flutter/page/home_page.dart';
import 'package:blackflag_github_flutter/page/login_page.dart';
import 'package:blackflag_github_flutter/page/welcom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(FlutterReduxApp());

class FlutterReduxApp extends StatelessWidget {
  final Store _store = Store<BFState>(appReducer, initialState: BFState(userInfo: User.empty()));

  @override
  Widget build(BuildContext context) {
    return StoreProvider<BFState>(
      store: _store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "welcome_page": (context) => WelcomePage(),
          "login_page": (context) => LoginPage(),
          "home_page": (context) => HomePage(),
          "/": (context) => WelcomePage(),
        },
      ),
    );
  }
}
