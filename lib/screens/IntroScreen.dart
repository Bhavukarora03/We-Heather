import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class TestScreen extends StatefulWidget {
  @override
  State<TestScreen> createState() => _TestScreenState();
}


class _TestScreenState extends State<TestScreen> {


  final List<Introduction> list = [
    Introduction(
      title: 'Damn the Weather'.toUpperCase(),
      subTitle: 'I know bish, its still in Beta. i would like to know from you, what else i can add?',
      imageUrl: 'images/3.png',
    ),
    Introduction(
      title: 'Search any place'.toUpperCase(),
      subTitle: 'I mean yeah. I ll be adding more features soon. but this is kinda okay too',
      imageUrl: 'images/17.png',
    ),
    Introduction(
      title: 'Buy me  biryani'.toUpperCase(),
      subTitle: 'Cmon you know my address. just Zomato me. okay enjoy',
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
