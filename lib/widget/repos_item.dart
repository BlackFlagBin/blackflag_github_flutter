import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:blackflag_github_flutter/widget/bf_card_item.dart';
import 'package:blackflag_github_flutter/widget/bf_icon_text.dart';
import 'package:flutter/material.dart';

class ReposItem extends StatelessWidget {
  final ReposViewModel reposViewModel;

  const ReposItem({Key key, this.reposViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BFCardItem(
          child: FlatButton(
              onPressed: () => {},
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipOval(
                          child: FadeInImage.assetNetwork(
                            placeholder: "static/images/logo.png",
                            image: reposViewModel.ownerPic,
                            fit: BoxFit.fitWidth,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              reposViewModel.repositoryName,
                              style: BFConstant.normalTextBold,
                            ),
                            BFIconText(
                              iconData: BFIcons.REPOS_ITEM_USER,
                              textStyle: BFConstant.subLightSmallText,
                              iconColor: Color(BFColors.subLightTextColor),
                              padding: 3,
                              iconSize: 10,
                              iconText: reposViewModel.ownerName,
                            )
                          ],
                        )),
                        Text(
                          "FFFF",
                          style: BFConstant.subSmallText,
                        )
                      ],
                    ),
                    Container(
                      child: Text(
                        reposViewModel.repositoryType,
                        style: BFConstant.subSmallText,
                      ),
                      margin: EdgeInsets.only(top: 6, bottom: 2),
                      alignment: Alignment.topLeft,
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Expanded(
                          child: new Center(
                            child: new BFIconText(
                              iconData: BFIcons.REPOS_ITEM_STAR,
                              iconText: reposViewModel.repositoryStar,
                              textStyle: BFConstant.subSmallText,
                              iconColor: Color(BFColors.subTextColor),
                              iconSize: 15.0,
                              padding: 5.0,
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Center(
                            child: new BFIconText(
                              iconData: BFIcons.REPOS_ITEM_FORK,
                              iconText: reposViewModel.repositoryFork,
                              textStyle: BFConstant.subSmallText,
                              iconColor: Color(BFColors.subTextColor),
                              iconSize: 15.0,
                              padding: 5.0,
                            ),
                          ),
                        ),
                        new Expanded(
                          flex: 2,
                          child: new Center(
                            child: new BFIconText(
                              iconData: BFIcons.REPOS_ITEM_ISSUE,
                              iconText: reposViewModel.repositoryWatch,
                              textStyle: BFConstant.subSmallText,
                              iconColor: Color(BFColors.subTextColor),
                              iconSize: 15.0,
                              padding: 5.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}

class ReposViewModel {
  String ownerName;
  String ownerPic;
  String repositoryName;
  String repositoryStar;
  String repositoryFork;
  String repositoryWatch;
  String hideWatchIcon;
  String repositoryType;
  String repositoryDes;
}
