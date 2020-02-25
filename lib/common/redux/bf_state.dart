import 'package:blackflag_github_flutter/common/model/event.dart';
import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/redux/user_redux.dart';

import 'event_redux.dart';

class BFState {
  User userInfo;
  List<Event> eventList = [];

  BFState({this.userInfo, this.eventList});
}

BFState appReducer(BFState state, dynamic action) {
  return BFState(
      userInfo: userReducer(state.userInfo, action),
      eventList: eventReducer(state.eventList, action));
}
