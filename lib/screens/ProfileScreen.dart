import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:lottie/lottie.dart';
import 'package:clima/screens/location_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const id = "ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Bhavuk",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          )),
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AvatarGlow(
              endRadius: 60.0,
              child: Material(
                // Replace this child with your own
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Lottie.network(
                    'https://assets8.lottiefiles.com/packages/lf20_ia8jpabk.json',
                    height: 40,
                  ),
                  radius: 50.0,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Bhavuk\n",
                style: TextStyle(color: Colors.black, fontSize: 20),
                children: [
                  TextSpan(
                    text: 'ROHINI',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 9,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),

          ],

        ),


      ),


    );
  }
}
