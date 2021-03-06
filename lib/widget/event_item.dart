import 'package:blackflag_github_flutter/common/model/event.dart';
import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:blackflag_github_flutter/widget/bf_card_item.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget descriptionWidget = (isEmpty(event.actionDes))
        ? Container()
        : Container(
            child: Text(
              event.actionDes,
              style: BFConstant.subSmallText,
            ),
            margin: EdgeInsets.only(top: 6, bottom: 2),
            alignment: Alignment.topLeft,
          );

    return Container(
      child: BFCardItem(
        child: FlatButton(
            onPressed: () {},
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
                          image: event.actionUserPic,
                          width: 30,
                          fit: BoxFit.fitWidth,
                          height: 30,
                          placeholder: "static/images/logo.png",
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Expanded(
                          child: Text(
                        event.actionUser,
                        style: BFConstant.smallTextBold,
                      )),
                      Text(
                        event.actionTime,
                        style: BFConstant.subSmallText,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      event.actionTarget,
                      style: BFConstant.smallTextBold,
                    ),
                    margin: EdgeInsets.only(top: 6, bottom: 2),
                    alignment: Alignment.topLeft,
                  ),
                  descriptionWidget,
                ],
              ),
            )),
      ),
    );
  }
}
