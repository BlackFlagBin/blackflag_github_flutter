import 'package:flutter/material.dart';

class BFInputWidget extends StatefulWidget {
  final String hintText;
  final IconData iconData;
  final TextStyle textStyle;
  final TextEditingController controller;
  final void Function(String) onChanged;

  const BFInputWidget(
      {Key key, this.hintText, this.iconData, this.textStyle, this.controller, this.onChanged})
      : super(key: key);

  @override
  _BFInputWidgetState createState() => _BFInputWidgetState();
}

class _BFInputWidgetState extends State<BFInputWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      style: widget.textStyle,
      decoration: InputDecoration(hintText: widget.hintText, icon: Icon(widget.iconData)),
    );
  }
}
