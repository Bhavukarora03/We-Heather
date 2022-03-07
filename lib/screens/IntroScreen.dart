import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import 'package:clima/screens/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class TestScreen extends StatefulWidget {
  @override
  State<TestScreen> createState() => _TestScreenState();
}


class _TestScreenState extends State<TestScreen> {


  final List<Introduction> list = [
    Introduction(
      title: 'Why did the cloud stay home?'.toUpperCase(),
      subTitle: 'Because it was feeling under the weather! From  temperature to humidity, I Gotchu!',
      imageUrl: 'images/3.png',
    ),
    Introduction(
      title: 'Search any place'.toUpperCase(),
      subTitle: 'If you are sitting in Germany and wondering how is the weather in New York, I Gotchu',
      imageUrl: 'images/17.png',
    ),
    Introduction(
      title: "what's the weather like today".toUpperCase(),
      subTitle: 'Windy ? humid ? How about we find out using this weather app. Allow me to get your location coordinates',
      imageUrl: 'images/27.png',
    ),


  ];

  Future<void> _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('Intro', true);
  }

    @override
    Widget build(BuildContext context) {
      return IntroScreenOnboarding(
        introductionList: list,
        onTapSkipButton: () {
          _incrementCounter();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoadingScreen(),
            ), //MaterialPageRoute
          );
        },
      );
    }
  }
