import 'package:flutter/material.dart';

import '../../save/presentation/save_page.dart';
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
    const SavePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (index != currentPageIndex) {
            setState(() {
              currentPageIndex = index;
            });
          }
        },
        // indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.save),
            icon: Icon(Icons.save_outlined),
            label: 'Save',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
