import 'package:blackflag_github_flutter/common/model/event.dart';
import 'package:blackflag_github_flutter/common/style/bf_style.dart';
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
              "hello world",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, height: 1.3, color: Colors.lightBlue),
            ),
            margin: EdgeInsets.only(top: 6, bottom: 2),
            alignment: Alignment.topLeft,
          );

    return Container(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        color: Color(BFColors.cardWhite),
        margin: EdgeInsets.all(10),
        child: FlatButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
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
                      Padding(padding: EdgeInsets.all(10)),
                      Expanded(child: Text(event.actionUser)),
                      Text("hello world"),
                    ],
                  ),
                  Container(
                    child: Text(
                      event.actionTarget,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.3,
                          color: Colors.lightBlue),
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
