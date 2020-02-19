import 'package:flutter/material.dart';

class BFFlexButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final void Function() onPress;

  const BFFlexButton({Key key, this.text, this.color, this.textColor, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: RaisedButton(
                color: color,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 20),
                ),
                textColor: textColor,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                onPressed: () {
                  if (onPress != null) {
                    onPress();
                  }
                }))
      ],
    );
  }
}
