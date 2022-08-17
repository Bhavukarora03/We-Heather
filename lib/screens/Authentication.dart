import 'package:clima/Getx/Getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends StatefulWidget {
  @override
  State<Authentication> createState() => _AuthenticationState();
}

SharedPreferences prefs;
Future<bool> checkValidation() async {
  prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('uuid');
}

class _AuthenticationState extends State<Authentication> {
  final controller = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> pageViewModal = [
      PageViewModel(
        title: 'Why did the cloud stay home?',
        body:
            'Because it was feeling under the weather! From  temperature to humidity, I Gotchu!',
        image: Image.asset(
          'images/17.png',
          scale: 15,
        ),
      ),
      PageViewModel(
        title: 'The coolest weather app...',
        body:
            'I will show you a magic trick. just allow me to give your location.',
        image: Image.asset(
          'images/6.png',
          scale: 15,
        ),
      ),
      PageViewModel(
          title: 'Lets get you signed up...',
          image: Image.asset(
            'images/27.png',
            scale: 15,
          ),
          bodyWidget: SignInButton(Buttons.Google, onPressed: () {
            controller.googleSignInMethod();
          })),
    ];
    return IntroductionScreen(
      globalBackgroundColor: Colors.black,
      showDoneButton: false,
      showNextButton: false,
      pages: pageViewModal,
    ); //Material App
  }
}
