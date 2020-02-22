import 'package:flutter/material.dart';

class BFInputWidget extends StatefulWidget {
  final String hintText;
  final IconData iconData;
  final TextStyle textStyle;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final bool obscureText;

  const BFInputWidget(
      {Key key,
      this.hintText,
      this.iconData,
      this.textStyle,
      this.controller,
      this.onChanged,
      this.obscureText = false})
      : super(key: key);

  @override
  _BFInputWidgetState createState() => _BFInputWidgetState();
}

class _BFInputWidgetState extends State<BFInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      onChanged: widget.onChanged,
      style: widget.textStyle,
      decoration: InputDecoration(hintText: widget.hintText, icon: Icon(widget.iconData)),
    );
  }
}
