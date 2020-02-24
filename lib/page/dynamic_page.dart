import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:blackflag_github_flutter/common/redux/user_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<BFState>(builder: (context, store) {
      Future.delayed(Duration(seconds: 2), () {
        User user = store.state.userInfo;
        user.login = "new login";
        user.name = "new name";
        store.dispatch(UpdateUserAction(user));
      });
      return Text(
        store.state.userInfo.login,
        style: Theme.of(context).textTheme.display1,
      );
    });
  }
}
