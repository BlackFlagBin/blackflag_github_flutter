import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Code {
  static const int NETWORK_ERROR = 1;
  static const int NETWORK_TIMEOUT = 2;
  static const int NETWORK_JSON_EXCEPTION = 3;
  static const int SUCCESS = 200;

  static String errorHandleFunction(int code, String message) {
    switch (code) {
      case 401:
        Fluttertoast.showToast(msg: BFStrings.network_error_401);
        return BFStrings.network_error_401;
        break;
      case 403:
        Fluttertoast.showToast(msg: BFStrings.network_error_403);
        return BFStrings.network_error_403;
        break;
      case 404:
        Fluttertoast.showToast(msg: BFStrings.network_error_404);
        return BFStrings.network_error_404;
        break;
      case NETWORK_TIMEOUT:
        Fluttertoast.showToast(msg: BFStrings.network_error_timeout);
        return BFStrings.network_error_timeout;
        break;
      default:
        Fluttertoast.showToast(msg: BFStrings.network_error_unknown);
        return BFStrings.network_error_unknown;
        break;
    }
  }
}
