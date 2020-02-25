import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/net/address.dart';
import 'package:blackflag_github_flutter/common/net/api.dart';
import 'package:blackflag_github_flutter/common/net/result_data.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:redux/redux.dart';

class EventDao {
  static void getEventReceived(Store<BFState> store,
      {int page = 0, void Function(ResultData result) callback}) async {
    User user = store.state.userInfo;
    if (user == null || user.login == null) {
      if (callback != null) {
        callback(null);
      }
      return;
    }

    String userName = user.login;
    String url = Address.getEventReceived(userName) + Address.getPageParams(tab: "?", page: page);
    var res = await HttpManager.netFetch(url, null, null, null);
    if (res != null && res.success) {
      print(res);
      if (callback != null) {
        callback(res);
      }
    } else {
      if (callback != null) {
        callback(null);
      }
    }
  }
}
