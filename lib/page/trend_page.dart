import 'package:blackflag_github_flutter/common/dao/repos_dao.dart';
import 'package:blackflag_github_flutter/widget/bf_pull_load_widget.dart';
import 'package:blackflag_github_flutter/widget/repos_item.dart';
import 'package:flutter/material.dart';

class TrendPage extends StatefulWidget {
  @override
  _TrendPageState createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> with AutomaticKeepAliveClientMixin {
  bool _isLoading = false;
  int _page = 1;
  BFPullLoadWidgetControl _pullLoadWidgetControl = BFPullLoadWidgetControl();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pullLoadWidgetControl.dataList.length == 0) {
      ReposDao.getTrendDao();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BFPullLoadWidget(
      control: _pullLoadWidgetControl,
      itemBuilder: (context, index) {
        return _renderItem(_pullLoadWidgetControl.dataList[index]);
      },
      onLoadMore: _onLoadMore,
      onRefresh: _handleRefresh,
    );
  }

  Future<Null> _handleRefresh() async {
    if (_isLoading) {
      return null;
    }

    _isLoading = true;
    _page = 1;
    var res = await ReposDao.getTrendDao(since: "daily", page: _page);
    if (res != null && res.data != null && res.data.length != 0) {
      setState(() {
        _pullLoadWidgetControl.dataList = res.data;
      });
    }

    setState(() {
      _pullLoadWidgetControl.needLoadMore = false;
    });
    _isLoading = false;

    return null;
  }

  Future<Null> _onLoadMore() async {
    return null;
  }

  ReposItem _renderItem(ReposViewModel item) {
    return ReposItem(
      reposViewModel: item,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
