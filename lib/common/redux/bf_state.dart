import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/redux/user_redux.dart';

class BFState {
  User userInfo;

  BFState({this.userInfo});
}

BFState appReducer(BFState state, dynamic action) {
  return BFState(userInfo: userReducer(state.userInfo, action));
}
