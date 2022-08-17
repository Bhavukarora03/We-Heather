import 'package:clima/screens/ProfileScreen.dart';
import 'package:clima/screens/Widgets.dart';
import 'package:clima/screens/loading_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'location_screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var weatherData = Get.arguments;
    final Screens = [HomeScreen(locationWeather: weatherData), ProfileSceen()];

    return Scaffold(
        body: WillPopScopeTo(
          titleText: "Are you sure you want to Quit",
          onPressedYes: (){
            SystemNavigator.pop(animated: true);
          },



            child: Screens[_currentIndex]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[100],
                gap: 2,

                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                duration: Duration(milliseconds: 5),
                tabBackgroundColor: Colors.grey[100],
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
