import 'dart:convert';

import 'package:blackflag_github_flutter/common/config/config.dart';
import 'package:blackflag_github_flutter/common/config/ignoreConfig.dart';
import 'package:blackflag_github_flutter/common/local/local_storage.dart';
import 'package:blackflag_github_flutter/common/net/address.dart';
import 'package:blackflag_github_flutter/common/net/api.dart';
import 'package:blackflag_github_flutter/common/net/result_data.dart';
import 'package:dio/dio.dart';

class UserDao {
  static void login(String userName, String password, Function(ResultData) callBack) async {
    String type = "${userName}:${password}";
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    if (Config.DEBUG) {
      print("base64Str login ${base64Str}");
    }

    await LocalStorage.saveString(Config.USER_NAME_KEY, userName);
    await LocalStorage.saveString(Config.USER_BASIC_CODE, base64Str);

    Map<String, dynamic> requestParams = {
      "scope": [
        "user",
        "repo",
        "gist",
        "notifications",
      ],
      "note": "admin_script",
      "client_id": NetConfig.CLIENT_ID,
      "client_secret": NetConfig.CLIENT_SECRET,
    };

    HttpManager.clearAuthorization();

    var res = await HttpManager.netFetch(
        Address.getAuthorization(), json.encode(requestParams), null, Options(method: "post"));
    if (res != null && res.success) {
      await LocalStorage.saveString(Config.PW_KEY, password);

      //todo 登录成功后
      print("login result ${res.success.toString()}");
      print(res.data.toString());

      if (callBack != null) {
        callBack(res);
      }
    }
  }
}
