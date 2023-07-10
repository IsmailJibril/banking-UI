import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:banking/pages/dashboard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getTaps(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageIndex = 4;
          });
        },
        child: Icon(
          Icons.credit_card_rounded,
          size: 25,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getBody(),
    );
  }

  Widget getTaps() {
    List<IconData> iconItems = [
      Icons.grid_view,
      Icons.mode_comment_rounded,
      Icons.notifications,
      Icons.account_circle,
    ];
    return AnimatedBottomNavigationBar(
      icons: iconItems,
      activeColor: Colors.blueAccent,
      splashColor: CupertinoColors.secondaryLabel,
      inactiveColor: Colors.black.withOpacity(0.5),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      activeIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DashboardPage(),
        Center(
          child: Text(
            'Chat Page',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            'Notification Page',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            'Account Page',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            'Cridit Card Page',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
