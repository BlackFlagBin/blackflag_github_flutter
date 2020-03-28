import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<BFState, String>(
        converter: (store) => store.state.userInfo.name,
        builder: (context, name) {
          return Text(
            name ?? "",
            style: Theme.of(context).textTheme.display1,
          );
        });
  }
}
