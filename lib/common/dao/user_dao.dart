import 'dart:convert';

import 'package:blackflag_github_flutter/common/config/config.dart';
import 'package:blackflag_github_flutter/common/config/ignoreConfig.dart';
import 'package:blackflag_github_flutter/common/local/local_storage.dart';
import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/net/address.dart';
import 'package:blackflag_github_flutter/common/net/api.dart';
import 'package:blackflag_github_flutter/common/net/result_data.dart';
import 'package:dio/dio.dart';
import 'package:quiver/strings.dart';

import 'dao_result.dart';

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
      DataResult resultData = await getUserInfo(null);

      //todo 登录成功后
      if (Config.DEBUG) {
        print("user result ${resultData.result.toString()}");
        print(resultData.data());
        print(res.data.toString());
      }

      if (callBack != null) {
        callBack(res);
      }
    }
  }

  static Future<DataResult> initUserInfo() async {
    var token = await LocalStorage.get(Config.TOKEN_KEY);
    var res = await getUserInfoLocal();
    if (res != null && res.result && isNotBlank(token)) {
      //todo store
    }

    return DataResult(res.data, (res.result && isNotBlank(token)));
  }

  static Future<DataResult> getUserInfoLocal() async {
    var userText = await LocalStorage.get(Config.USER_INFO);
    if (isNotBlank(userText)) {
      var userMap = json.decode(userText);
      var user = User.fromJson(userMap);
      return DataResult(user, true);
    } else {
      return DataResult(null, false);
    }
  }

  static Future<DataResult> getUserInfo(String userName) async {
    ResultData res;
    if (isBlank(userName)) {
      res = await HttpManager.netFetch(Address.getMyUserInfo(), null, null, null);
    } else {
      res = await HttpManager.netFetch(Address.getUserInfo(userName), null, null, null);
    }

    if (res != null && res.success) {
      User user = User.fromJson(res.data);
      user.starredUrl = "---";
      if (isBlank(userName)) {
        LocalStorage.saveString(Config.USER_INFO, json.encode(res.data));
      }

      return DataResult(user, true);
    } else {
      return DataResult(res.data, false);
    }
  }
}
