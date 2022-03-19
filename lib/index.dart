import 'package:flutter/material.dart';
import 'package:state_manager/dashboard.dart';
import 'package:state_manager/reports.dart';
import 'package:state_manager/settings.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Drawer _sideMenu() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Icon(Icons.verified_user_rounded),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: Icons.dashboard_customize_outlined,
            press: () {
              setState(() {
                currentTabIndex = 0;
              });
              openCloseDrawer();
            },
          ),
          DrawerListTile(
            title: "Reports",
            svgSrc: Icons.report_gmailerrorred_rounded,
            press: () {
              setState(() {
                currentTabIndex = 1;
              });
              openCloseDrawer();
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: Icons.contact_mail_rounded,
            press: () {
              setState(() {
                currentTabIndex = 2;
              });
              openCloseDrawer();
            },
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _openDrawer = GlobalKey<ScaffoldState>();
  List<Widget> tabs = [
    Dashboard(),
    Reports(),
    Settings(),
  ];

  List<String> titles = [
    "Dashboard",
    "Reports",
    "Settings",
  ];

  int currentTabIndex = 0;

  void openCloseDrawer() {
    if (_openDrawer.currentState!.isDrawerOpen) {
      _openDrawer.currentState!.openEndDrawer();
    } else {
      _openDrawer.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _openDrawer,
      drawer: _sideMenu(),
      extendBody: true,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
          centerTitle: true,
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: Text(
              titles[currentTabIndex],
              key: Key(titles[currentTabIndex]),
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: tabs[currentTabIndex],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        svgSrc,
        color: Colors.black,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
