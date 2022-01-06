import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';




void main() {
  runApp(IntroScreen());
}

class IntroScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'We-Heather',
      theme: ThemeData.light(
      ).copyWith(primaryColor: Colors.black),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Damn the Weather'.toUpperCase(),
      subTitle: 'I know bish, its still in Beta. i would like to know from you, what else i can add. i have lot on my mind tho',
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

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
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
