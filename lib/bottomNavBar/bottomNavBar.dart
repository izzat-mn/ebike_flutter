import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context, listen: true);

    return PersistentTabView(
      context,
      controller: provider.indexController,
      onItemSelected: (val) {
        provider.onItemSelected(val);
      },

      screens: provider.pages,
      items: provider.navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colour.blackBottomNavBar,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}
