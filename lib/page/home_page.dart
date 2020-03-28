import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:blackflag_github_flutter/page/dynamic_page.dart';
import 'package:blackflag_github_flutter/page/my_page.dart';
import 'package:blackflag_github_flutter/page/trend_page.dart';
import 'package:blackflag_github_flutter/widget/bf_tab_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String sName = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return BFTabBarWidget(
      type: BFTabTypes.TAB_BOTTOM,
      title: BFStrings.app_name,
      backgroundColor: BFColors.primarySwatch,
      indicatorColor: Colors.white,
      tabItems: <Widget>[
        Tab(
          icon: Icon(
            BFIcons.MAIN_DT,
            color: BFColors.primarySwatch,
          ),
        ),
        Tab(
          icon: Icon(
            BFIcons.MAIN_QS,
            color: BFColors.primarySwatch,
          ),
        ),
        Tab(
          icon: Icon(
            BFIcons.MAIN_MY,
            color: BFColors.primarySwatch,
          ),
        ),
      ],
      tabViews: <Widget>[
        DynamicPage(),
        TrendPage(),
        MyPage(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
