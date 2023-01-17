import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:habit_app_front/screens/LoginPage.dart';
import 'package:habit_app_front/screens/SignpPage.dart';
import 'package:habit_app_front/screens/calenderpage.dart';
import 'package:habit_app_front/screens/homepage.dart';
import 'package:habit_app_front/widgets/pop_up/popUpPage.dart';
import 'package:habit_app_front/screens/profilePage.dart';
import 'package:habit_app_front/screens/searchPage.dart';
import 'package:habit_app_front/screens/try.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selectedIndex = 0;
  List<Widget> lstWidget = [
    const Homepage(),
    const CalenderPage(),
    const SearchBarPage(),
    ProfilePage(),
    // const MyWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: lstWidget[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: EdgeInsets.all(18),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite_border,
                text: "Likes",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
