import 'package:blackflag_github_flutter/common/model/user.dart';
import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:blackflag_github_flutter/widget/bf_card_item.dart';
import 'package:blackflag_github_flutter/widget/bf_icon_text.dart';
import 'package:flutter/material.dart';

class UserHeaderItem extends StatelessWidget {
  final User userInfo;

  UserHeaderItem(this.userInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BFCardItem(
            color: Color(BFColors.primaryValue),
            margin: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipOval(
                        child: FadeInImage.assetNetwork(
                          placeholder: "static/images/logo.png",
                          //预览图
                          fit: BoxFit.fitWidth,
                          image: userInfo.avatarUrl,
                          width: 80.0,
                          height: 80.0,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(userInfo.login, style: BFConstant.largeTextWhiteBold),
                            Text(userInfo.name, style: BFConstant.subLightSmallText),
                            BFIconText(
                              iconData: BFIcons.USER_ITEM_COMPANY,
                              iconText: userInfo.company == null
                                  ? BFStrings.nothing_now
                                  : userInfo.company,
                              textStyle: BFConstant.subLightSmallText,
                              iconColor: Color(BFColors.subLightTextColor),
                              padding: 3.0,
                              iconSize: 10.0,
                            ),
                            BFIconText(
                              iconData: BFIcons.USER_ITEM_LOCATION,
                              iconText: userInfo.location == null
                                  ? BFStrings.nothing_now
                                  : userInfo.location,
                              textStyle: BFConstant.subLightSmallText,
                              iconColor: Color(BFColors.subLightTextColor),
                              iconSize: 10.0,
                              padding: 3.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      child: BFIconText(
                        iconData: BFIcons.USER_ITEM_LINK,
                        iconText: userInfo.blog == null ? BFStrings.nothing_now : userInfo.blog,
                        textStyle: BFConstant.subLightSmallText,
                        iconColor: Color(BFColors.subLightTextColor),
                        iconSize: 10.0,
                        padding: 3.0,
                      ),
                      margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
                      alignment: Alignment.topLeft),
                  Container(
                      child: Text(
                        userInfo.bio == null ? BFStrings.nothing_now : userInfo.bio,
                        style: BFConstant.subLightSmallText,
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
                      alignment: Alignment.topLeft),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Divider(
                    color: Color(BFColors.subLightTextColor),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text("仓库\n" + userInfo.publicRepos.toString(),
                              textAlign: TextAlign.center, style: BFConstant.subSmallText),
                        ),
                      ),
                      Container(width: 0.3, height: 40.0, color: Color(BFColors.subLightTextColor)),
                      Expanded(
                        child: Center(
                          child: Text("粉丝\n" + userInfo.followers.toString(),
                              textAlign: TextAlign.center, style: BFConstant.subSmallText),
                        ),
                      ),
                      Container(width: 0.3, height: 40.0, color: Color(BFColors.subLightTextColor)),
                      Expanded(
                        child: Center(
                          child: Text(
                            "关注\n" + userInfo.following.toString(),
                            textAlign: TextAlign.center,
                            style: BFConstant.subSmallText,
                          ),
                        ),
                      ),
                      Container(width: 0.3, height: 40.0, color: Color(BFColors.subLightTextColor)),
                      Expanded(
                        child: Center(
                          child: Text("星标\n---",
                              textAlign: TextAlign.center, style: BFConstant.subSmallText),
                        ),
                      ),
                      Container(width: 0.3, height: 40.0, color: Color(BFColors.subLightTextColor)),
                      Expanded(
                        child: Center(
                          child: Text("荣耀\n---",
                              textAlign: TextAlign.center, style: BFConstant.subSmallText),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
