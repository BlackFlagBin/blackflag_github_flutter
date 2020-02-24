import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      Image.asset(
                        "static/images/logo.png",
                        width: 30,
                        height: 30,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Expanded(child: Text("hello world")),
                      Text("hello world"),
                    ],
                  ),
                  Container(
                    child: Text(
                      "hello world",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.3,
                          color: Colors.lightBlue),
                    ),
                    margin: EdgeInsets.only(top: 6, bottom: 2),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    child: Text(
                      "hello world",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.3,
                          color: Colors.lightBlue),
                    ),
                    margin: EdgeInsets.only(top: 6, bottom: 2),
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
