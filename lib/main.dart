
import 'package:flutter/material.dart';
import 'package:clima/screens/IntroScreen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



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
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: intro ? LoadingScreen() : TestScreen(),

        );
      }

      else {return Container();}
    }
    );
  }
}

