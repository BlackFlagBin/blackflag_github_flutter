import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:blackflag_github_flutter/common/redux/user_redux.dart';
import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:blackflag_github_flutter/widget/bf_tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BFTabBarWidget(
      type: BFTabTypes.TAB_BOTTOM,
      title: "Title",
      backgroundColor: BFColors.primarySwatch,
      indicatorColor: Colors.white,
      tabItems: <Widget>[
        StoreBuilder<BFState>(
          builder: (BuildContext context, Store store) {
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
          },
        ),
        StoreConnector<BFState, String>(
            builder: (context, name) {
              return Text(
                name,
                style: Theme.of(context).textTheme.display1,
              );
            },
            converter: (store) => store.state.userInfo.name),
        Tab(
          icon: Icon(Icons.directions_bike),
        ),
      ],
      tabViews: <Widget>[
        Icon(Icons.directions_car),
        Icon(Icons.directions_transit),
        Icon(Icons.directions_bike),
      ],
    );
  }
}
