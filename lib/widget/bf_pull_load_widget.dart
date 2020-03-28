import 'package:blackflag_github_flutter/common/model/event.dart';
import 'package:blackflag_github_flutter/common/style/bf_style.dart';
import 'package:flutter/material.dart';

class BFPullLoadWidget extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;

  final Future<void> Function() onLoadMore;

  final RefreshCallback onRefresh;

  final BFPullLoadWidgetControl control;

  const BFPullLoadWidget({Key key, this.itemBuilder, this.onLoadMore, this.onRefresh, this.control})
      : super(key: key);

  @override
  _BFPullLoadWidgetState createState() => _BFPullLoadWidgetState();
}

class _BFPullLoadWidgetState extends State<BFPullLoadWidget> {
  @override
  Widget build(BuildContext context) {
    var listSize = widget.control.dataList.length;

    return NotificationListener<OverscrollNotification>(
        onNotification: (notification) {
          if (widget.control.needLoadMore && widget.onLoadMore != null) {
            widget.onLoadMore();
          }
          return true;
        },
        child: RefreshIndicator(
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == listSize && listSize != 0) {
                  return _buildProgressIndicator();
                } else {
                  return widget.itemBuilder(context, index);
                }
              },
              itemCount: (listSize > 0) ? (listSize + 1) : listSize,
            ),
            onRefresh: widget.onRefresh));
  }

  Widget _buildProgressIndicator() {
    Widget bottomWidget =
        widget.control.needLoadMore ? CircularProgressIndicator() : Text(BFStrings.load_more_not);

    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(child: bottomWidget),
    );
  }
}

class BFPullLoadWidgetControl {
  List<Event> dataList = [];
  bool needLoadMore = true;
}
