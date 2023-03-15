import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/constants.dart';
import 'package:furniture_store/view/favourites.dart';
import 'package:furniture_store/view/home_screen.dart';
import 'package:furniture_store/view/profile.dart';
import 'package:furniture_store/view/shopping_cart.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _initialActiveIndex = 1;
  late PageController _pageController;
  List<Widget> tabPages = [
    Favourites(),
    HomeScreen(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialActiveIndex);
  }

  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: _initialActiveIndex,
        onTap: onTabTapped,
        color: Constants.btnPrimColor,
        activeColor: Colors.deepOrange.shade600,
        backgroundColor: Constants.secondaryColor,
        style: TabStyle.reactCircle,
        items: [
          TabItem(
            icon: Icon(
              EvaIcons.heart,
              color: Constants.btnPrimColor,
            ),
            title: 'Favorites',
          ),
          TabItem(
            icon: Icon(
              EvaIcons.home,
              color: Constants.btnPrimColor,
            ),
            title: 'Home',
          ),
          TabItem(
              icon: Icon(
                EvaIcons.person,
                color: Constants.btnPrimColor,
              ),
              title: 'Profile'),
        ],
      ),
      body: PageView(
        onPageChanged: onPageChanged,
        controller: _pageController,
        children: tabPages,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _initialActiveIndex = page;
    });
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
