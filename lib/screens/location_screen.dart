import 'package:flutter/material.dart';

import 'package:clima/services/weather.dart';
import 'city_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;
  String imagesToGrab;
  //int humidity;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get data Chill';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      //var condition = weatherData['weather'][0]['id'];
      //weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
      //humidity = weatherData['main']['humidity'];



    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(




        decoration: BoxDecoration(

          // image:  new DecorationImage(
          //   image: weather== null ? print('abc'): imagesToGrab[0]
          // )
           gradient: new LinearGradient(

            begin: Alignment.topCenter,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.blueGrey,
              Colors.white
            ],



)


        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[


                  MaterialButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(

                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Center(child: Image.asset('images/compas.png',scale: 15.0))
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 120.0),

                child: Row(

                  children: <Widget>[
                    Image.asset('images/thermometer.png', scale: 8),
                    RichText(
                      text: TextSpan(
                        text: '$temperature°C\n',
                        style: GoogleFonts.getFont('Overpass',fontSize: 50.0,fontWeight: FontWeight.bold, color: Colors.black ),
                        children: [
                          TextSpan(
                            text: 'Current temp',
                              style: GoogleFonts.getFont('Overpass',fontSize: 18.0,fontWeight: FontWeight.w600, color: Colors.grey )
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding
                (padding: EdgeInsets.only(left: 10.0)
                ,child: Row(children: [

                Image.asset('images/fresh-air.png', scale: 8),

                RichText(
                  text: TextSpan(
                    text: 'acjh \n',
                    style: GoogleFonts.getFont('Overpass',fontSize: 1.0,fontWeight: FontWeight.bold, color: Colors.black ),
                    children: [
                      TextSpan(
                          text: 'Humidity',
                          style: GoogleFonts.getFont('Overpass',fontSize: 18.0,fontWeight: FontWeight.w600, color: Colors.grey )
                      ),

                    ],
                  ),
                )
              ],),),
              Padding(
                padding: EdgeInsets.only(left: 100.0)
,                child: Row(
                  children: <Widget>[

                    RichText(
                      text: TextSpan(
                        text: 'In \n',
                        style: GoogleFonts.getFont('Overpass',fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.grey ),
                        children: [
                          TextSpan(
                              text: '$cityName',
                              style: GoogleFonts.getFont('Overpass',fontSize: 50.0,fontWeight: FontWeight.w600, color: Colors.black )
                          ),

                        ],
                      ),
                    )
                  ],
                ),

              ),
              MaterialButton(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                highlightColor: Colors.white,

                onPressed: () async {

                  var weatherData = await weather.getLocationWeather();
                  updateUI(weatherData);
                },
                child: Image.asset('images/map-pin.png',
                scale: 10.0,
                //height: 150.0,
                //width: 200.0),
              ),

              )],
          ),
        ),
      ),
    );
  }
}
