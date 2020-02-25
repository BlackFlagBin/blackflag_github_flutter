import 'package:blackflag_github_flutter/common/dao/event_dao.dart';
import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:blackflag_github_flutter/common/redux/user_redux.dart';
import 'package:blackflag_github_flutter/widget/bf_pull_load_widget.dart';
import 'package:blackflag_github_flutter/widget/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  BFPullLoadWidgetControl _pullLoadWidgetControl = BFPullLoadWidgetControl();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Store<BFState> store = StoreProvider.of<BFState>(context);
    EventDao.getEventReceived(store);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<BFState>(builder: (context, store) {
      Future.delayed(Duration(seconds: 2), () {
        User user = store.state.userInfo;
        user.login = "new login";
        user.name = "new name";
        store.dispatch(UpdateUserAction(user));
      });
      return BFPullLoadWidget(
        onNotification: _onNotification,
        control: _pullLoadWidgetControl,
        itemBuilder: (context, index) => EventItem(),
        onRefresh: _handleRefresh,
      );
    });
  }

  Future<Null> _handleRefresh() async {
    setState(() {
      _pullLoadWidgetControl.count = 5;
    });
    return null;
  }

  bool _onNotification(Notification notification) {
    if (notification is OverscrollNotification) {
      setState(() {
        _pullLoadWidgetControl.count += 5;
      });
    }

    return true;
  }
}
