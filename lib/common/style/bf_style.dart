import 'package:flutter/material.dart';

class BFColors {
  static const String welcomeMessage = "Welcome to Flutter";

  static const int primaryValue = 0xFF24292E;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;

  static const miWhite = 0xffececec;
  static const white = 0xFFFFFFFF;
  static const transparentColor = 0x00000000;

  static const mainBackgroundColor = miWhite;
  static const tabBackgroundColor = 0xffffffff;
  static const cardBackgroundColor = 0xFFFFFFFF;
  static const cardShadowColor = 0xff000000;
  static const actionBlue = 0xff267aff;

  static const lineColor = 0xff42464b;

  static const webDraculaBackgroundColor = 0xff282a36;

  static const selectedColor = primaryDarkValue;

  static const titleTextColor = miWhite;
  static const mainTextColor = primaryDarkValue;
  static const subTextColor = 0xff959595;
  static const subLightTextColor = 0xffc4c4c4;
  static const TextColorWhite = 0xFFFFFFFF;
  static const TextColorMiWhtte = miWhite;

  static const tabSelectedColor = primaryValue;
  static const tabUnSelectColor = 0xffa6aaaf;

  static const MaterialColor primarySwatch = const MaterialColor(primaryValue, const <int, Color>{
    50: const Color(primaryLightValue),
    100: const Color(primaryLightValue),
    200: const Color(primaryLightValue),
    300: const Color(primaryLightValue),
    400: const Color(primaryLightValue),
    500: const Color(primaryValue),
    600: const Color(primaryDarkValue),
    700: const Color(primaryDarkValue),
    800: const Color(primaryDarkValue),
    900: const Color(primaryDarkValue),
  });
}

class BFConstant {
  // navbar 高度
  static const iosnavHeaderHeight = 70.0;
  static const andrnavHeaderHeight = 70.0;

  static const largetTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextWhiteSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;

  // tabBar 高度
  static const tabBarHeight = 44.0;
  static const tabIconSize = 20.0;

  static const normalIconSize = 40.0;
  static const bigIconSize = 50.0;
  static const largeIconSize = 80.0;
  static const smallIconSize = 30.0;
  static const minIconSize = 20.0;
  static const littleIconSize = 10.0;

  static const normalMarginEdge = 10.0;
  static const normalNumberOfLine = 4.0;

  static const titleTextStyle = TextStyle(
    color: Color(BFColors.titleTextColor),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const smallTextWhite = TextStyle(
    color: Color(BFColors.TextColorWhite),
    fontSize: smallTextSize,
  );

  static const smallText = TextStyle(
    color: Color(BFColors.mainTextColor),
    fontSize: smallTextSize,
  );

  static const smallTextBold = TextStyle(
    color: Color(BFColors.mainTextColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const subLightSmallText = TextStyle(
    color: Color(BFColors.subLightTextColor),
    fontSize: smallTextSize,
  );

  static const miLightSmallText = TextStyle(
    color: Color(BFColors.miWhite),
    fontSize: smallTextSize,
  );

  static const subSmallText = TextStyle(
    color: Color(BFColors.subTextColor),
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    color: Color(BFColors.mainTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const normalText = TextStyle(
    color: Color(BFColors.mainTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextBold = TextStyle(
    color: Color(BFColors.mainTextColor),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const subNormalText = TextStyle(
    color: Color(BFColors.subTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextWhite = TextStyle(
    color: Color(BFColors.TextColorWhite),
    fontSize: normalTextSize,
  );

  static const normalTextMitWhite = TextStyle(
    color: Color(BFColors.miWhite),
    fontSize: normalTextSize,
  );

  static const normalTextLight = TextStyle(
    color: Color(BFColors.primaryLightValue),
    fontSize: normalTextSize,
  );

  static const middleTextWhite = TextStyle(
    color: Color(BFColors.TextColorWhite),
    fontSize: middleTextWhiteSize,
  );

  static const largeText = TextStyle(
    color: Color(BFColors.mainTextColor),
    fontSize: bigTextSize,
  );

  static const largeTextWhite = TextStyle(
    color: Color(BFColors.TextColorWhite),
    fontSize: bigTextSize,
  );
}

class BFStrings {
  static const String app_name = "BFGithubAppFlutter";

  static const String login_text = "登录";
  static const String login_username_hint_text = "请输入github用户名";
  static const String login_password_hint_text = "请输入密码";
  static const String login_success = "登录成功";

  static const String network_error_401 = "未授权或授权登录失败";
  static const String network_error_403 = "403权限错误";
  static const String network_error_404 = "404错误";
  static const String network_error_timeout = "请求超时";
  static const String network_error_unknown = "其他异常";

  static const String load_more_not = "没有更多数据";
}

class BFIcons {
  static const String FONT_FAMILY = "wxcIconFont";

  static const IconData MAIN_DT = IconData(0xe684, fontFamily: BFIcons.FONT_FAMILY);

  static const IconData MAIN_QS = IconData(0xe818, fontFamily: BFIcons.FONT_FAMILY);

  static const IconData MAIN_MY = IconData(0xe6d0, fontFamily: BFIcons.FONT_FAMILY);

  static const IconData REPOS_ITEM_USER = IconData(0xe63e, fontFamily: BFIcons.FONT_FAMILY);
}
