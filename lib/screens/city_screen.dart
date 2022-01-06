import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: BoxDecoration(

          color: Colors.white,
          image: DecorationImage(image: AssetImage('images/citysc.gif'),fit: BoxFit.contain)
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: <Color>[
          //     Colors.lightBlueAccent,
          //     Colors.white30,
          //     Colors.orange,
          //     Colors.blueGrey,
          //   ],
          //
          // ),
      ),

        child: SafeArea(
          child: Column(
            children: [

              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(

                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                ),
              ),

              Container(

                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration.copyWith(),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 13.0,
                  child:
              MaterialButton(

                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
