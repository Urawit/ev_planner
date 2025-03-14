import 'package:ev_planner/shared/theme/ev_design_system.dart';
import 'package:flutter/material.dart';

import '../../bookmark/presentation/bookmark_page.dart';
import '../../setting/presentation/setting_page.dart';
import 'widgets/widgets.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;
  final List<Widget> _pages = [
    const NavigationWidget(),
    const BookmarkPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: EVDesignSystem.colors.orange.withAlpha(200),
        onDestinationSelected: (int index) {
          if (index != currentPageIndex) {
            setState(() {
              currentPageIndex = index;
            });
          }
        },
        // indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Image.asset("assets/images/navigation_tab_icon.png",
                scale: 4.5),
            label: 'Navigation',
          ),
          NavigationDestination(
            icon:
                Image.asset("assets/images/bookmark_tab_icon.png", scale: 4.0),
            label: 'Save',
          ),
          NavigationDestination(
            icon: Image.asset("assets/images/setting_tab_icon.png", scale: 4.0),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
