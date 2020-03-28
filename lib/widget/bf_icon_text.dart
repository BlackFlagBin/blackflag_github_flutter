import 'package:flutter/material.dart';

class BFIconText extends StatelessWidget {
  final String iconText;
  final IconData iconData;
  final TextStyle textStyle;
  final Color iconColor;
  final double padding;
  final double iconSize;

  const BFIconText(
      {Key key,
      this.iconText,
      this.iconData,
      this.textStyle,
      this.iconColor,
      this.padding,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
        Padding(padding: EdgeInsets.all(padding)),
        Text(
          iconText,
          style: textStyle,
        )
      ],
    );
  }
}
