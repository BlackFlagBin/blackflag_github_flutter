import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:flutter/material.dart';

class BFCardItem extends StatelessWidget {
  final Widget child;

  const BFCardItem({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      color: Color(BFColors.cardWhite),
      margin: EdgeInsets.all(10),
      child: child,
    );
  }
}
