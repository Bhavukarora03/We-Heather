import 'package:clima/Bindings/GetxBindings.dart';
import 'package:clima/Getx/Getx_controller.dart';
import 'package:clima/screens/NavigationScreen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/Authentication.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {


  final controller = Get.put(()=> AuthenticationController());
  Future<bool> checkValidation() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('uuid');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkValidation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool intro = snapshot.data;
          return GetMaterialApp(
            initialBinding: GetxBinds(),
            theme: ThemeData.dark().copyWith(
              useMaterial3: true
            ),
            debugShowCheckedModeBanner: false,
            home: intro ? LoadingScreen(): Authentication(),
          );
        } else
          return FittedBox();
      },
    );
  }
}
