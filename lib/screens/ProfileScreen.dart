import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clima/Getx/Getx_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSceen extends StatefulWidget {
  const ProfileSceen({Key key}) : super(key: key);

  @override
  State<ProfileSceen> createState() => _ProfileSceenState();
}

class _ProfileSceenState extends State<ProfileSceen> {
  final AuthenticationController controller =
      Get.put(AuthenticationController());
  @override
  initState() {
    super.initState();
    controller.checkInternetConnection();
    initializeValues();
  }

  String userName = "";
  String imgUrl = "";
  String mail = "";
  SharedPreferences prefs;
  initializeValues() async {
    prefs = await SharedPreferences.getInstance();
    String doctorName = prefs.getString("name");
    String imageURL = prefs.getString("ProfileURL");
    String mailId = prefs.getString("mailID");
    setState(() {
      userName = doctorName;
      imgUrl = imageURL;
      mail = mailId;
    });
  }


  @override
  Widget build(BuildContext context) {
    final url = Uri.parse(imgUrl);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // user card
            CachedNetworkImage(
              imageUrl: imgUrl,
              imageBuilder: (context, imageProvider) => Padding(
                padding: const EdgeInsets.all(50.0),
                child: CircleAvatar(

                  foregroundImage: imageProvider,
                  radius: 80,

                ),
              ),
              placeholder: (context, url) => SpinKitCircle(color: Colors.white, size: 50.0),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Divider(
              color: Colors.black87,
              indent: 50,
              endIndent: 50,
              height: 30,
              thickness: .5,
            ),
            SettingsGroup(
              settingsGroupTitleStyle: TextStyle(color: Colors.black87),
              iconItemSize: 20,
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.person,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.black87,
                  ),
                  title: userName == "" ? "User not signed in" : "${userName}",
                  titleStyle: TextStyle(color: Colors.black87),
                  subtitle: mail == "" ? "Welcome" : "${mail}",
                ),
                SettingsItem(
                  onTap: () {
                    Get.find<AuthenticationController>().logout();
                  },
                  icons: Icons.logout,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.black87,
                  ),
                  titleStyle: TextStyle(color: Colors.black87),
                  title: 'Logout',
                  subtitle: "You have to sign in again for updates",
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}


