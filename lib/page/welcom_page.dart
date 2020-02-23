import 'package:blackflag_github_flutter/common/dao/dao_result.dart';
import 'package:blackflag_github_flutter/common/dao/user_dao.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    toNext(DataResult res) {
      String routeStr = "";
      if (res != null && res.result) {
        routeStr = "home_page";
      } else {
        routeStr = "login_page";
      }
      Navigator.of(context).pushReplacementNamed(routeStr);
    }

    return StoreBuilder<BFState>(
      builder: (BuildContext context, Store store) {
        Future.delayed(Duration(seconds: 2), () async {
          //判断去登录还是主页
          var res = await UserDao.initUserInfo(store);
          print(res);
          toNext(res);
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
      },
    );
  }
}
