import 'package:flutter/material.dart';

enum BFTabTypes { TAB_TOP, TAB_BOTTOM }

class BFTabBarWidget extends StatefulWidget {
  final BFTabTypes type;
  final String title;
  final Color indicatorColor;
  final Color backgroundColor;
  final List<Widget> tabItems;
  final List<Widget> tabViews;

  const BFTabBarWidget(
      {Key key,
      this.type,
      this.title,
      this.indicatorColor,
      this.backgroundColor,
      this.tabItems,
      this.tabViews})
      : super(key: key);

  @override
  _BFTabBarWidgetState createState() => _BFTabBarWidgetState();
}

class _BFTabBarWidgetState extends State<BFTabBarWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    if (widget.type == BFTabTypes.TAB_BOTTOM) {
      _tabController = TabController(length: 3, vsync: this);
    }
  }

  @override
  void dispose() {
    if (widget.type == BFTabTypes.TAB_BOTTOM) {
      _tabController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget displayWidget = Container();

    switch (widget.type) {
      case BFTabTypes.TAB_TOP:
        displayWidget = Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: widget.backgroundColor,
            bottom: TabBar(
              tabs: widget.tabItems,
              indicatorColor: widget.indicatorColor,
            ),
          ),
          body: TabBarView(children: widget.tabViews),
        );
        break;
      case BFTabTypes.TAB_BOTTOM:
        displayWidget = Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: widget.backgroundColor,
          ),
          body: TabBarView(
            children: widget.tabViews,
            controller: _tabController,
          ),
          bottomNavigationBar: TabBar(
            tabs: widget.tabItems,
            controller: _tabController,
            indicatorColor: widget.indicatorColor,
          ),
        );
        break;
    }

    return displayWidget;
  }
}
