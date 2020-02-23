import 'package:blackflag_github_flutter/common/config/config.dart';
import 'package:blackflag_github_flutter/common/local/local_storage.dart';
import 'package:blackflag_github_flutter/common/net/code.dart';
import 'package:blackflag_github_flutter/common/net/result_data.dart';
import 'package:dio/dio.dart';
import 'package:quiver/strings.dart';

class HttpManager {
  static const String CONTENT_TYPE_JSON = "application/json";
  static const String CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  static Future<ResultData> netFetch(
      String url, String params, Map<String, String> header, Options option) async {
    Map<String, String> headers = {};
    if (header != null) {
      headers.addAll(header);
    }

    if (isBlank(optionParams["authorizationCode"])) {
      var authorizationCode = await getAuthorization();
      if (isNotBlank(authorizationCode)) {
        optionParams["authorizationCode"] = authorizationCode;
      }
    }

    headers["Authorization"] = optionParams["authorizationCode"];

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "get");
      option.headers = headers;
    }

    var dio = Dio();
    Response response;

    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 666);
      }

      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (Config.DEBUG) {
        print("请求异常: ${e.toString()}");
      }

      return ResultData(
          success: false,
          data: Code.errorHandleFunction(errorResponse.statusCode, e.message),
          code: errorResponse.statusCode);
    }

    if (Config.DEBUG) {
      print("请求url: ${url}");
      if (params != null) {
        print("请求参数: ${params.toString()}");
      }

      if (response != null) {
        print("返回结果: ${response.toString()}");
      }
    }

    try {
      if (option.contentType != null && option.contentType == "text") {
        return ResultData(success: true, data: response.data, code: Code.SUCCESS);
      } else {
        var responseJson = response.data;
        if (response.statusCode == 201 && isNotBlank(responseJson["token"])) {
          optionParams["authorizationCode"] = "token ${responseJson["token"]}";
          await LocalStorage.saveString(Config.TOKEN_KEY, optionParams["authorizationCode"]);
        }

        if (response.statusCode == 200 || response.statusCode == 201) {
          return ResultData(
              success: true, data: response.data, code: Code.SUCCESS, headers: response.headers);
        }
      }
    } catch (e) {
      print("${e.toString()} ${url}");
      return ResultData(
          success: false,
          data: response.data,
          code: response.statusCode,
          headers: response.headers);
    }

    return ResultData(
        success: false,
        data: Code.errorHandleFunction(response.statusCode, ""),
        code: response.statusCode);
  }

  static Future<String> getAuthorization() async {
    var token = await LocalStorage.get(Config.TOKEN_KEY);
    if (isBlank(token)) {
      var basicCode = await LocalStorage.get(Config.USER_BASIC_CODE);
      if (isBlank(basicCode)) {
        //todo 提示输入账号密码
        return null;
      } else {
        //todo 通过basicCode获取token，获取到设置，返回token
        return "Basic ${basicCode}";
      }
    } else {
      optionParams["authorizationCode"] = token;
      return token;
    }
  }

  static void clearAuthorization() {
    optionParams["authorizationCode"] = null;
    LocalStorage.remove(Config.TOKEN_KEY);
  }
}
