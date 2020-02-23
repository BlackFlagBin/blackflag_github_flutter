import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:redux/redux.dart';

var userReducer = combineReducers<User>([TypedReducer<User, UpdateUserAction>(_updateLoaded)]);

User _updateLoaded(User user, UpdateUserAction action) {
  return action.user;
}

class UpdateUserAction {
  User user;

  UpdateUserAction(this.user);
}
