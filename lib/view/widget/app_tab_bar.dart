import 'package:flutter/material.dart';

class AppTabBar extends StatefulWidget {
  final TabController tabController;

  const AppTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      tabs: [
        Tab(text: '지하철',),
        Tab(text: '버스',)
      ],
    );
  }
}
