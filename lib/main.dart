
import 'package:clima/screens/HistoryScreen.dart';
import 'package:clima/screens/NavigationScreen.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/IntroScreen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clima/screens/ProfileScreen.dart';



void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  Future<bool>_incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('Intro') && prefs.getBool('Intro');

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(future: _incrementCounter(), builder: (context,snapshot) {
      if (snapshot.hasData) {
        bool intro = snapshot.data;
        return MaterialApp(
          theme: ThemeData.dark().copyWith(

          ),
          debugShowCheckedModeBanner: false,
          initialRoute: NavigationScreen.id,
          routes: {
            NavigationScreen.id: (context) => NavigationScreen(),
            LocationScreen.id: (context) => LocationScreen(),
            CityScreen.id: (context) => CityScreen(),
            HistoryScreen.id: (context) => HistoryScreen(),
            ProfileScreen.id: (context) => ProfileScreen()


          },
          home: intro ? LoadingScreen() : TestScreen(),


        );
      }

      else {return Container();}
    }
    );
  }
}

