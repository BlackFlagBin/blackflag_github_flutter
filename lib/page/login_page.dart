import 'package:blackflag_github_flutter/common/style/bf_colors.dart';
import 'package:blackflag_github_flutter/widget/bf_flex_button.dart';
import 'package:blackflag_github_flutter/widget/bf_input_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(BFColors.primaryValue),
      child: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Color(BFColors.cardWhite),
          margin: EdgeInsets.all(30),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  "static/images/logo.png",
                  width: 80,
                  height: 80,
                ),
                Padding(padding: EdgeInsets.all(10)),
                BFInputWidget(
                  hintText: "输入账号",
                  iconData: Icons.alarm,
                ),
                Padding(padding: EdgeInsets.all(10)),
                BFInputWidget(
                  hintText: "输入密码",
                  iconData: Icons.alarm,
                ),
                Padding(padding: EdgeInsets.all(30)),
                BFFlexButton(
                  textColor: Color(BFColors.textWhite),
                  text: BFStrings.login_text,
                  color: Color(BFColors.primaryValue),
                  onPress: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
