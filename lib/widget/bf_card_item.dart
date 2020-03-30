import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:flutter/material.dart';

class BFCardItem extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final Color color;
  final RoundedRectangleBorder shape;

  const BFCardItem(
      {Key key,
      @required this.child,
      this.margin = const EdgeInsets.all(10),
      this.color = const Color(BFColors.cardWhite),
      this.shape =
          const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: shape,
      color: color,
      margin: margin,
      child: child,
    );
  }
}
