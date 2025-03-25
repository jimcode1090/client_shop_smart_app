import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currentScreen = 2;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    pageController = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          pageController.jumpToPage(currentScreen);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(IconlyBold.home),
            label: 'Home',
            selectedIcon: Icon(IconlyBold.home),
          ),
          NavigationDestination(
            icon: Icon(IconlyBold.search),
            label: 'Search',
            selectedIcon: Icon(IconlyBold.search),
          ),
          NavigationDestination(
            icon: Icon(IconlyBold.bag2),
            label: 'Cart',
            selectedIcon: Icon(IconlyBold.bag2),
          ),
          NavigationDestination(
            icon: Icon(IconlyBold.profile),
            label: 'Profile',
            selectedIcon: Icon(IconlyBold.profile),
          ),
        ],
      ),
    );
  }
}
