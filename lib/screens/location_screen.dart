import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  final Map<int, AssetImage> imagesToCapture = {
    0: AssetImage('images/29.png'),
    1: AssetImage('images/27.png'),
    2: AssetImage('images/36.png'),
    3: AssetImage('images/3.png'),
  };

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> with SingleTickerProviderStateMixin{
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  Color weatherMessage;

  int humidity;
  String weatherSeason;
  int pressure;
  double wind;
  String imagesToCapture;

  @override
  void initState() {
    super.initState();
    setState(() {
      updateUI(widget.locationWeather);
    });
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = Colors.white;
        cityName = '404 LOL';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      //var condition = weatherData['weather'][0]['id'];
      //weatherIcon = weather.getWeatherIcon(condition);
      //weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
      humidity = weatherData['main']['humidity'];
      weatherSeason = weatherData['weather'][0]['main'];
      pressure = weatherData['main']['pressure'];
      wind = weatherData['wind']['speed'];
    });

    // AnimationController controller;
    // Animation animation;
    //
    // controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    //
    //
    // //animation = ColorTween(begin: Colors.white, end: Colors.black).animate(controller);
    // controller.forward();
    // controller.addListener(()  {setState(() {
    //
    // });controller.value;});
    //
    //  void dispose(){
    //  controller.dispose();
    //  super.dispose();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.black,
      //   items: <Widget>[
      //     Icon(Icons.add, size: 25),
      //     Icon(Icons.map_sharp, size: 25),
      //     Icon(Icons.compare_arrows, size: 25),
      //   ],
      //   onTap: (index) { setState(() {
      //
      //   });
      //     //Handle button tap
      //   },
      // ),
      body:  Container(
          decoration: BoxDecoration(
            gradient: KGradientCondtional,
      ),

        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "   Today's Report",
                    style: GoogleFonts.getFont('Montserrat',
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Material(
                    color: Colors.black,
                    shadowColor: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(40.0),
                    elevation: 12.0,
                    child: MaterialButton(
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
                        child: Icon(
                          Icons.map_outlined,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'In   ',
                        style: GoogleFonts.getFont(
                          'Overpass',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                              text: '$cityName',
                              style: GoogleFonts.getFont(
                                'Overpass',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    temperature < 10
                        ? Image.asset(
                            'images/23.png',
                            scale: 10,
                          )
                        : Center(),
                    temperature < 20 && temperature > 10
                        ? Image.asset('images/17.png', scale: 10)
                        : Center(),
                    temperature < 30 && temperature > 20
                        ? Image.asset('images/27.png', scale: 10)
                        : Center(),
                    SizedBox(height: 25.0),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Its $weatherSeason\n',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: '$temperature°\n',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontSize: 80.0,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Column(children: [
                      Image.asset('images/3.png', scale: 50.0),
                      SizedBox(height: 20.0),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '$humidity %\n',
                          style: GoogleFonts.getFont(
                            'Overpass',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                                text: 'Humidity',
                                style: GoogleFonts.getFont('Overpass',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Column(
                      children: [
                        Image.asset('images/36.png', scale: 15.0),
                        SizedBox(height: 20.0),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '$pressure\n',
                            style: GoogleFonts.getFont(
                              'Overpass',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Pressure',
                                  style: GoogleFonts.getFont('Overpass',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Column(
                      children: [
                        Image.asset('images/6.png', scale: 55.0),
                        SizedBox(height: 20.0),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '$wind \n',
                            style: GoogleFonts.getFont(
                              'Overpass',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Wind Km/h',
                                  style: GoogleFonts.getFont('Overpass',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Column(
                      children: [
                        Hero(
                            tag: 'location',
                            child: MaterialButton(
                                onPressed: () async {
                                  var weatherData =
                                      await weather.getLocationWeather();
                                  updateUI(weatherData);
                                },
                                child: Icon(Icons.location_pin, size: 40)))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
