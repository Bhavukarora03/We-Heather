import 'package:clima/screens/NavigationScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocationData();
  }



  void getLocationData() async {
    PermissionStatus location = await Permission.location.request();
    var weatherData = await WeatherModel().getLocationWeather();
    Future.delayed(Duration(milliseconds: 200), () {
      if (location == PermissionStatus.granted) {
        return Get.to(() => NavigationScreen(), arguments: weatherData);
      }
      if (location == PermissionStatus.denied) {
        showSimpleNotification(Text("Location permission denied"));
      }
      if (location == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(color: Colors.white, size: 50.0);
  }
}
