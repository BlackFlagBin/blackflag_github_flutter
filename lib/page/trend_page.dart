import 'package:blackflag_github_flutter/common/dao/repos_dao.dart';
import 'package:flutter/material.dart';

class TrendPage extends StatefulWidget {
  @override
  _TrendPageState createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ReposDao.getTrendDao();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "5555555",
      style: Theme.of(context).textTheme.display1,
    );
  }
}
