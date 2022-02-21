import '/Screens/RateUsScreen.dart';
import '/Screens/SettingsScreen.dart';
import '/Widgets/DashboardWidgets/AppBarWidget.dart';
import 'package:flutter/material.dart';

//importing Screens
import '../Widgets/DashboardWidgets/NavDrawerWidget.dart';
import 'BusScreen.dart';
import 'HomeScreen.dart';
import 'Profile.dart';
import 'Search.dart';

//importing Widget
//import '/Widget/NavigationDrawerWidget.dart';
//importing packages
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 3;
  final screens = [
    const HomeScreen(),
    const Search(),
    const BusScreen(),
    const Profile(),
    const SettingsScreen(),
    const RateUsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(
        Icons.search,
        size: 30,
      ),
      const Icon(
        Icons.bus_alert,
        size: 30,
      ),
      const Icon(
        Icons.perm_identity,
        size: 30,
      ),
      const Icon(
        Icons.star,
        size: 30,
      ),
    ];
    return Scaffold(
      extendBody: true,
        //theme: theme,
        //drawer: NavigationDrawerWidget(),
        appBar: buildAppBar(context),
        body: IndexedStack(
            index: currentIndex,
            children: screens
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: SafeArea(//for the IOS home button
            child: CurvedNavigationBar(
              height: 60,
              index: currentIndex,
              items: items,
              animationDuration: const Duration(milliseconds: 300),
              onTap: (index) => setState(
                () => (currentIndex = index),
              ),
            ),
          ),
        ));
  }
}
