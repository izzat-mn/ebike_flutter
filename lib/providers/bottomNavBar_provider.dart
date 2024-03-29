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
        icon: Image.asset('assets/icons/home.png',
            color: indexController.index == 0 ? Colour.black : Colour.grey,
            height: 20),
        title: ("Home"),
        activeColorPrimary: Colour.yellow,
        activeColorSecondary: Colour.black,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/icons/my_bike.png',
            color: indexController.index == 1 ? Colour.black : Colour.grey,
            height: 20),
        title: ("My Bike"),
        activeColorPrimary: Colour.yellow,
        activeColorSecondary: Colour.black,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/icons/order.png',
            color: indexController.index == 2 ? Colour.black : Colour.grey,
            height: 20),
        title: ("Order"),
        activeColorPrimary: Colour.yellow,
        activeColorSecondary: Colour.black,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/icons/profile.png',
            color: indexController.index == 3 ? Colour.black : Colour.grey,
            height: 20),
        title: ("Profile"),
        activeColorPrimary: Colour.yellow,
        activeColorSecondary: Colour.black,
      ),
    ];
  }
}
