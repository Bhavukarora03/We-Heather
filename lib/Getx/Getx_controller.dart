import 'dart:async';

import 'package:clima/screens/Authentication.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/NavigationScreen.dart';


class AuthenticationController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  ///Storing _googlesignin from Google sign in constructor

  final _googlesignin = GoogleSignIn();

  SharedPreferences prefs;

  RxBool hasInternet = false.obs;

  ConnectivityResult connectivityResult = ConnectivityResult.none;

  /// storing variables from classes that comes from Google sign in [package]
  ///
  ///The State only changes if the value change
  ///We use Rx because To make it observable. also it can be null

  var googleSignUser = Rx<GoogleSignInAccount>(null);
  var authCredential = Rx<AuthCredential>(null);



  ///Functionality that helps to sign in to google account
  ///Initializes SharedPreferences from shared_preferences [package] for persisting the state of the app
  ///

  StreamSubscription internetSubscription;

  ///Check the internet Connectivity and shows the simple overlay
  checkInternetConnection() {
    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
          final hasInternet = status == InternetConnectionStatus.connected;
          this.hasInternet.value = hasInternet;
          hasInternet
              ? null
              : showSimpleNotification(
              const Text(
                "No Internet connection",
              ),
              background: Colors.red.shade800);
        });
  }

  @override
  void dispose() {
    internetSubscription.cancel();
    super.dispose();
  }


  googleSignInMethod() async {
    hasInternet.value = await InternetConnectionChecker().hasConnection;
    hasInternet.value
        ? null
        : showSimpleNotification(const Text("No Internet Connection"),
        background: Colors.red.shade700);

    hasInternet.value
        ? googleSignUser.value = await _googlesignin.signIn()
        : null;

    if (googleSignUser.value != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignUser.value.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
    prefs = await SharedPreferences.getInstance();
    prefs.setString("name", googleSignUser.value.displayName.capitalizeFirst);
    prefs.setString("mailID", googleSignUser.value.email);
    prefs.setString("ProfileURL", googleSignUser.value.photoUrl);
    prefs.setString("uuid", googleSignUser.value.id);

    ///Calls user setup function after signing in and sets up the user in the database


    ///Checks if user is null or not
    ///
    try {
      if (googleSignUser.value == null) {
        Get.to(() =>  Authentication());
      } else {
        Get.offAll(() => LoadingScreen());
      }
    } catch (e) {
      // print(e);
    }
  }
  logout() async{
    await auth.signOut();
    prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('mailID');
    prefs.remove("ProfileURL");

    if(auth.currentUser == null){

      Get.off(() => Authentication());
    } else {
      Get.to(() =>  NavigationScreen());

    }
  }
}