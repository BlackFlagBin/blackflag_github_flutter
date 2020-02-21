import 'package:blackflag_github_flutter/common/config/config.dart';
import 'package:blackflag_github_flutter/common/dao/user_dao.dart';
import 'package:blackflag_github_flutter/common/local/local_storage.dart';
import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:blackflag_github_flutter/widget/bf_flex_button.dart';
import 'package:blackflag_github_flutter/widget/bf_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiver/strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username;
  String _password;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initParams();
  }

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
                  hintText: BFStrings.login_username_hint_text,
                  iconData: Icons.alarm,
                  controller: _usernameController,
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  },
                ),
                Padding(padding: EdgeInsets.all(10)),
                BFInputWidget(
                  hintText: BFStrings.login_password_hint_text,
                  iconData: Icons.alarm,
                  controller: _passwordController,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                Padding(padding: EdgeInsets.all(30)),
                BFFlexButton(
                  textColor: Color(BFColors.textWhite),
                  text: BFStrings.login_text,
                  color: Color(BFColors.primaryValue),
                  onPress: () {
                    if (isBlank(_username) || isBlank(_password)) {
                      return;
                    }
                    UserDao.login(_username, _password, (data) {
                      if (data != null && data.success) {
                        Fluttertoast.showToast(msg: BFStrings.login_success);
                      }
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initParams() async {
    _username = await LocalStorage.get(Config.USER_NAME_KEY);
    _password = await LocalStorage.get(Config.PW_KEY);
    _usernameController.text = _username;
    _passwordController.text = _password;
  }
}
