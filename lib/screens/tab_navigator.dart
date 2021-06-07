import 'package:automotiveapp/screens/homescreen.dart';
import 'package:automotiveapp/screens/map.dart';
import 'package:automotiveapp/screens/myvehicle.dart';

import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Page1")
      child = HomeScreen();
    else if (tabItem == "Page2")
      child = MyVehicle();
    else if (tabItem == "Page3") child = GarageMap();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
