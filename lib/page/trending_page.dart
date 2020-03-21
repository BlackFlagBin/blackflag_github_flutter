import 'package:blackflag_github_flutter/common/config/config.dart';
import 'package:blackflag_github_flutter/common/dao/event_dao.dart';
import 'package:blackflag_github_flutter/common/model/event.dart';
import 'package:blackflag_github_flutter/common/redux/bf_state.dart';
import 'package:blackflag_github_flutter/widget/bf_pull_load_widget.dart';
import 'package:blackflag_github_flutter/widget/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  bool _isLoading = false;
  int _page = 1;
  List<Event> _dataList = [];

  BFPullLoadWidgetControl _pullLoadWidgetControl = BFPullLoadWidgetControl();

  @override
  void didChangeDependencies() {
    Store<BFState> store = StoreProvider.of<BFState>(context);
    _pullLoadWidgetControl.dataList = store.state.eventList;
    _handleRefresh();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<BFState>(builder: (context, store) {
      return BFPullLoadWidget(
        onLoadMore: _onLoadMore,
        control: _pullLoadWidgetControl,
        itemBuilder: buildEventItem,
        onRefresh: _handleRefresh,
      );
    });
  }

  Widget buildEventItem(BuildContext context, int index) =>
      EventItem(event: _pullLoadWidgetControl.dataList[index]);

  Future<Null> _handleRefresh() async {
    if (_isLoading) {
      return null;
    }

    _isLoading = true;
    _page = 1;
    var result = await EventDao.getEventReceived(StoreProvider.of(context));

    setState(() {
      _pullLoadWidgetControl.needLoadMore = (result != null && result.length == Config.PAGE_SIZE);
      if (result != null) {
        _pullLoadWidgetControl.dataList = result;
      }
    });
    _isLoading = false;
    return null;
  }

  Future<void> _onLoadMore() async {
    if (_isLoading) {
      return;
    }

    _isLoading = true;
    _page++;

    var result = await EventDao.getEventReceived(StoreProvider.of(context));
    setState(() {
      _pullLoadWidgetControl.needLoadMore = (result != null && result.length == Config.PAGE_SIZE);
      if (result != null && result.length != 0) {
        _pullLoadWidgetControl.dataList.addAll(result);
      }
    });
    _isLoading = false;
  }
}
