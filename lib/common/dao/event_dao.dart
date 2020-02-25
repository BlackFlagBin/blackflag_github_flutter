import 'package:blackflag_github_flutter/common/model/event.dart';
import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/net/address.dart';
import 'package:blackflag_github_flutter/common/net/api.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:blackflag_github_flutter/common/redux/event_redux.dart';
import 'package:redux/redux.dart';

class EventDao {
  static Future<List<Event>> getEventReceived(Store<BFState> store, {int page = 1}) async {
    User user = store.state.userInfo;
    if (user == null || user.login == null) {
      return null;
    }

    String userName = user.login;
    String url = Address.getEventReceived(userName) + Address.getPageParams(tab: "?", page: page);
    var res = await HttpManager.netFetch(url, null, null, null);
    if (res != null && res.success) {
      var data = res.data;
      if (data == null || data.length == 0) {
        return null;
      }

      List<Event> list = [];
      for (var i = 0; i < data.length; ++i) {
        list.add(Event.fromJson(data[i]));
      }

      if (page == 1) {
        store.dispatch(RefreshEventAction(list));
      } else {
        store.dispatch(LoadMoreEventAction(list));
      }
      return list;
    } else {
      return null;
    }
  }
}
