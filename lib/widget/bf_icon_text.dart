import 'package:flutter/material.dart';

class BFIconText extends StatelessWidget {
  final String iconText;
  final IconData iconData;
  final TextStyle textStyle;
  final Color iconColor;
  final double padding;
  final double iconSize;
  final VoidCallback onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  const BFIconText(
      {Key key,
      this.iconText,
      this.iconData,
      this.textStyle,
      this.iconColor,
      this.padding = 0,
      this.iconSize,
      this.onPressed,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.max,
      this.crossAxisAlignment = CrossAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
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
