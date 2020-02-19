import 'package:flutter/material.dart';

class BFInputWidget extends StatefulWidget {
  final String hintText;
  final IconData iconData;

  const BFInputWidget({Key key, this.hintText, this.iconData}) : super(key: key);

  @override
  _BFInputWidgetState createState() => _BFInputWidgetState();
}

class _BFInputWidgetState extends State<BFInputWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(hintText: widget.hintText, icon: Icon(widget.iconData)),
    );
  }
}
