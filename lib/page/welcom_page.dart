import 'package:blackflag_github_flutter/common/dao/user_dao.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:blackflag_github_flutter/common/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class WelcomePage extends StatefulWidget {
  static var sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Store<BFState> store = StoreProvider.of<BFState>(context);
    Future.delayed(Duration(seconds: 2), () async {
      //判断去登录还是主页
      var res = await UserDao.initUserInfo(store);
      if (res != null && res.result) {
        NavigatorUtils.goHome(context);
      } else {
        NavigatorUtils.goLogin(context);
      }
    });

    return StoreBuilder<BFState>(
      builder: (BuildContext context, Store store) {
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
      },
    );
  }
}
