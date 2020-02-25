import 'package:blackflag_github_flutter/common/model/event.dart';
import 'package:redux/redux.dart';

var eventReducer = combineReducers<List<Event>>([
  TypedReducer<List<Event>, RefreshEventAction>(_refresh),
  TypedReducer<List<Event>, LoadMoreEventAction>(_loadMore),
]);

List<Event> _refresh(List<Event> list, RefreshEventAction action) {
  if (action.list == null) {
    return [];
  } else {
    list = action.list;
  }
  return list;
}

List<Event> _loadMore(List<Event> list, LoadMoreEventAction action) {
  if (action.list != null) {
    list.addAll(action.list);
  }
  return list;
}

class RefreshEventAction {
  List<Event> list;

  RefreshEventAction(this.list);
}

class LoadMoreEventAction {
  List<Event> list;

  LoadMoreEventAction(this.list);
}
