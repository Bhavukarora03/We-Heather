import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:lottie/lottie.dart';
import 'city_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
//import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  static const id = 'LocationScreen';
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with SingleTickerProviderStateMixin {

  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  static String cityName;
  Color weatherMessage;

  int humidity;
  String weatherSeason;
  int pressure;
  double wind;
  String imagesToCapture;

  // AnimationController controller;
  // Animation animation;

  @override
  void initState() {
    super.initState();
    setState(() {
      updateUI(widget.locationWeather);
      //SystemChrome.setEnabledSystemUIOverlays([]);
    });
    @override
    void dispose() {
      dispose();
      super.dispose();
    }
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        //weatherMessage = Colors.white;
        cityName = 'Could not Fetch Data';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      //var condition = weatherData['weather'][0]['id'];
      //weatherIcon = weather.getWeatherIcon(condition);
      // weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
      humidity = weatherData['main']['humidity'];
      weatherSeason = weatherData['weather'][0]['main'];
      pressure = weatherData['main']['pressure'];
      //  wind = weatherData['wind']['speed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:
     Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 2.3,

            center: Alignment.topCenter,
            // begin: Alignment.topCenter,
            // end: Alignment.bottomLeft,

            colors: [Colors.black, Colors.white],
            stops: [0.6, .45],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: RichText(
                      text: TextSpan(
                          text: "Today's Report",
                          style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.white70,
                              fontWeight: FontWeight.w900),
                          children: [
                            TextSpan(
                              text: '\n\nIn  ',
                              style: GoogleFonts.overpass(
                                  color: Colors.white70, fontSize: 15),
                            ),
                            TextSpan(
                                text: '$cityName',
                                style: GoogleFonts.roboto(
                                    color: Colors.white70,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700)),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: FloatingActionButton(
                        heroTag: "btn2",
                        backgroundColor: Colors.white,
                        focusColor: Colors.white70,
                        foregroundColor: Colors.black,
                        elevation: 10,
                        //color: Colors.black,
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
                          Icons.share_location,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedSwitcher(
                        reverseDuration: Duration(milliseconds: 1500),
                        duration: Duration(milliseconds: 1500),
                        child: temperature <= 5
                            ? Container(
                                height: 200,
                                width: 200,
                                key: Key('1'),
                                child: Lottie.network(
                                  'https://assets10.lottiefiles.com/packages/lf20_hf07cbmv.json',
                                  //  scale: 14,
                                ),
                                // decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/3.png',)))
                              )
                            : temperature >= 6 || temperature <= 10
                                ? Container(
                                    height: 200,
                                    width: 200,
                                    key: Key('2'),
                                    child: Lottie.network(
                                      'https://assets10.lottiefiles.com/temp/lf20_RHbbn6.json',
                                    ),
                                    //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                  )
                                : temperature >= 11 || temperature <= 15
                                    ? Container(
                                        height: 200,
                                        width: 200,
                                        key: Key('3'),
                                        child: Lottie.network(
                                          'https://assets10.lottiefiles.com/temp/lf20_Jj2Qzq.json',
                                        ),
                                        //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                      )
                                    : temperature >= 16 || temperature <= 20
                                        ? Container(
                                            height: 200,
                                            width: 200,
                                            key: Key('4'),
                                            child: Lottie.network(
                                              'https://assets5.lottiefiles.com/temp/lf20_BSVgyt.json',
                                            ),
                                            //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                          )
                                        : temperature >= 21 || temperature <= 25
                                            ? Container(
                                                height: 200,
                                                width: 200,
                                                key: Key('5'),
                                                child: Lottie.network(
                                                  'https://assets4.lottiefiles.com/private_files/lf30_j1g2rpsv.json',
                                                ),
                                                //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                              )
                                            : temperature >= 26
                                                ? Container(
                                                    height: 200,
                                                    width: 200,
                                                    key: Key('6'),
                                                    child: Lottie.network(
                                                      'https://assets10.lottiefiles.com/temp/lf20_Stdaec.json',
                                                    ),
                                                    //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                                  )
                                                : Text("sorry")),
                    SizedBox(height: 5.0),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "It's $weatherSeason\n",
                        style: GoogleFonts.getFont('Montserrat',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                        children: [
                          TextSpan(
                              text: '$temperature°\n',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontSize: 50.0,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [
                     Lottie.network('https://assets9.lottiefiles.com/packages/lf20_74gqrlus.json', height: 20, width: 20),
                      SizedBox(height: 10.0),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '$humidity %\n',
                          style: GoogleFonts.getFont('Overpass',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                          children: [
                            TextSpan(
                              text: 'Humidity',
                              style: GoogleFonts.getFont('Overpass',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    Column(
                      children: [
                        Lottie.network('https://assets3.lottiefiles.com/packages/lf20_4pku29fg.json'
                            , height: 20, width: 20),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '$pressure\n',
                            style: GoogleFonts.getFont('Overpass',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                            children: [
                              TextSpan(
                                text: 'Pressure',
                                style: GoogleFonts.getFont('Overpass',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Lottie.network('https://assets6.lottiefiles.com/packages/lf20_qdgvz2hn.json', height: 20, width: 20),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '$wind \n',
                            style: GoogleFonts.getFont('Overpass',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                            children: [
                              TextSpan(
                                text: 'Wind Km/h',
                                style: GoogleFonts.getFont('Overpass',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.white,
                    elevation: 10,
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(Icons.location_pin,
                        size: 30, color: Colors.black87),
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

// AnimatedCrossFade(
// firstChild: Image.asset(
// 'images/23.png',
// scale: 14,
// ),
// secondChild: Image.asset(
// 'images/17.png',
// scale: 14,
// ),
// crossFadeState: temperature <= 15
// ? CrossFadeState.showFirst
//     : CrossFadeState.showSecond,
// duration: Duration(milliseconds: 1000)),
// temperature <= 10
// ? Image.asset(
// 'images/23.png',
//
// )
// : temperature >= 11 || temperature <= 20
// ? Image.asset('images/17.png', scale: 14)
// : temperature >= 21 || temperature > 30
// ? Image.asset('images/27.png', scale: 15)
// : Center(),
