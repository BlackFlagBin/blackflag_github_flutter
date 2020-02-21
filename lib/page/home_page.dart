import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:blackflag_github_flutter/widget/bf_tab_bar_widget.dart';
import 'package:flutter/material.dart';

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
        Tab(
          icon: Icon(Icons.directions_car),
        ),
        Tab(
          icon: Icon(Icons.directions_transit),
        ),
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
