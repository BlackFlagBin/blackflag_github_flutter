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
              itemCount: _getListCount(),
            ),
            onRefresh: widget.onRefresh));
  }

  int _getListCount() {
    var listSize = widget.control.dataList.length;
    if (widget.control.needHeader) {
      return listSize > 0 ? listSize + 2 : listSize + 1;
    } else {
      return listSize > 0 ? listSize + 1 : listSize;
    }
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
  List dataList = [];
  bool needLoadMore = true;
  bool needHeader = false;
}
