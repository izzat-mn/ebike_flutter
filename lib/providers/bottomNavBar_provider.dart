import 'package:ebike_flutter/utils/util.dart';
import 'package:ebike_flutter/views/view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBarProvider with ChangeNotifier {
  PersistentTabController indexController =
      PersistentTabController(initialIndex: 0);

  onItemSelected(int index) {
    indexController.index = index;
    notifyListeners();
  }

  List<Widget> pages = [
    const HomeView(),
    Container(),
    Container(),
    Container(),
  ];

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_rounded,
            color: indexController.index == 0 ? Colour.black : Colour.grey),
        title: ("Home"),
        activeColorPrimary: Colour.yellow,
        activeColorSecondary: Colour.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.directions_bike,
            color: indexController.index == 1 ? Colour.black : Colour.grey),
        title: ("My Bike"),
        activeColorPrimary: Colour.yellow,
        activeColorSecondary: Colour.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_rounded,
            color: indexController.index == 2 ? Colour.black : Colour.grey),
        title: ("Profile"),
        activeColorPrimary: Colour.yellow,
        activeColorSecondary: Colour.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.check_box_rounded,
            color: indexController.index == 3 ? Colour.black : Colour.grey),
        title: ("Order"),
        activeColorPrimary: Colour.yellow,
        activeColorSecondary: Colour.black,
      ),
    ];
  }
}
