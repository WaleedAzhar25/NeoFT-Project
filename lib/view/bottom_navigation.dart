import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/view/add/add_screen.dart';
import 'package:nft/view/explore/explore.dart';
import 'package:nft/view/home/home_screen.dart';
import 'package:nft/view/profile/profile_screen.dart';
import 'package:nft/view/search/search.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   PersistentTabController ?_controller;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _controller = PersistentTabController(initialIndex: 0);

   }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          margin: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: Colors.white,

          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
        ),
      )
    );
  }
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ExploreScreen(),
      const AddScreen(),
      const SearchScreen(),
      const Profile(),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.black,
        icon: const Icon(Icons.home_sharp,),
        inactiveColorPrimary: Colors.grey,
        title: 'Home',
        textStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12),
        iconSize: 28
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.black,
        icon: const Icon(Icons.explore,),
        inactiveColorPrimary: Colors.grey,
        title: 'Explore',
        textStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12),
        iconSize: 28
      ),
      PersistentBottomNavBarItem(
        contentPadding: 70.0,
        inactiveColorPrimary: primaryColor,
        activeColorPrimary: primaryColor,

        iconSize: 35,
        icon: const Icon(CupertinoIcons.add,color: Colors.white,),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.search),
        title: ("Search"),
          textStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12),
          activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
          textStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12),
          activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey
      ),
    ];
  }
}
