import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker_app/pages/budget_page.dart';
import 'package:budget_tracker_app/pages/create_budget_page.dart';
import 'package:budget_tracker_app/pages/daily_page.dart';
import 'package:budget_tracker_app/pages/profile.dart';
import 'package:budget_tracker_app/pages/stats_page.dart';
import 'package:budget_tracker_app/theme/colors.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;
  List<Widget> pages = [
    DailyPage(),
    StatsPage(),
    BudgetPage(),
    Profile(),
    CreateBudgetPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
            },
            backgroundColor: primary,
            child: const Icon(
              Icons.add,
              size: 25,
            )
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.calendar_month,
      Icons.bar_chart,
      Icons.wallet,
      Icons.person,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
