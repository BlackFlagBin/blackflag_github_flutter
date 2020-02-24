import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:blackflag_github_flutter/common/redux/user_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class BFPullLoadWidget extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;

  final NotificationListenerCallback<Notification> onNotification;

  final RefreshCallback onRefresh;

  final BFPullLoadWidgetControl control;

  const BFPullLoadWidget(
      {Key key, this.itemBuilder, this.onNotification, this.onRefresh, this.control})
      : super(key: key);

  @override
  _BFPullLoadWidgetState createState() => _BFPullLoadWidgetState();
}

class _BFPullLoadWidgetState extends State<BFPullLoadWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<BFState>(builder: (context, store) {
      Future.delayed(Duration(seconds: 2), () {
        User user = store.state.userInfo;
        user.name = "new login";
        user.name = "new name";
        store.dispatch(UpdateUserAction(user));
      });

      return NotificationListener(
          onNotification: widget.onNotification,
          child: RefreshIndicator(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: widget.itemBuilder,
                itemCount: widget.control.count,
              ),
              onRefresh: widget.onRefresh));
    });
  }
}

class BFPullLoadWidgetControl {
  int count = 5;
}
