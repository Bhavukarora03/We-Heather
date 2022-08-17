import 'package:cached_network_image/cached_network_image.dart';
import 'package:clima/Getx/Getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({@required this.locationWeather});
  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();

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
    Get.find<AuthenticationController>().checkInternetConnection();
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
        cityName = 'Retry';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      //var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      humidity = weatherData['main']['humidity'];
      weatherSeason = weatherData['weather'][0]['main'];
      pressure = weatherData['main']['pressure'];
      wind = weatherData['wind']['speed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMEd().add_jms().format(DateTime.now());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.black,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          // For iOS (dark icons)
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 2.3,
              center: Alignment.topCenter,
              colors: [Colors.black, Colors.white],
              stops: [0.7, .45],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 50, bottom: 40),
                  child: TextField(
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white70,
                      enableSuggestions: true,
                      controller: textEditingController,
                      showCursor: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: kTextFieldInputDecoration.copyWith(),
                      onSubmitted: (value) async {
                        var weatherData = await weather.getCityWeather(value);
                        updateUI(weatherData);
                        setState(() {
                          textEditingController.clear();
                        });
                      }),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: RichText(
                        text: TextSpan(
                            text: "Today's report in",
                            style: GoogleFonts.roboto(
                                fontSize: 22,
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
                              TextSpan(
                                  text:
                                      '\n\n(${DateFormat.jm().format(DateTime.now())})',
                                  style: GoogleFonts.roboto(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w700))
                            ]),
                      ),
                    ),
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
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedSwitcher(
                        reverseDuration: Duration(milliseconds: 1500),
                        duration: Duration(milliseconds: 1500),

                        child: temperature <= 5
                            ? Container(
                                height: 150,
                                width: 150,
                                key: Key('1'),
                                child: Lottie.asset(
                                  'Lottie/snowy.json',
                                  //  scale: 14,
                                ),
                                // decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/3.png',)))
                              )
                            : temperature >= 6 || temperature <= 10
                                ? Container(
                                    height: 200,
                                    width: 200,
                                    key: Key('2'),
                                    child: Lottie.asset(
                                      'Lottie/night.json',
                                    ),
                                    //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                  )
                                : temperature >= 11 || temperature <= 15
                                    ? Container(
                                        height: 200,
                                        width: 200,
                                        key: Key('3'),
                                        child: Lottie.asset(
                                          'Lottie/cloudy.json',
                                        ),
                                        //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                      )
                                    : temperature >= 16 || temperature <= 20
                                        ? Container(
                                            height: 200,
                                            width: 200,
                                            key: Key('4'),
                                            child: Lottie.asset(
                                              'Lottie/humidity.json',
                                            ),
                                            //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                          )
                                        : temperature >= 21 || temperature <= 25
                                            ? Container(
                                                height: 200,
                                                width: 200,
                                                key: Key('5'),
                                                child: Lottie.asset(
                                                  'Lottie/night.json',
                                                ),
                                                //decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/27.png',) ))
                                              )
                                            : temperature >= 26
                                                ? Container(
                                                    height: 100,
                                                    width: 100,
                                                    key: Key('6'),
                                                    child: Lottie.asset(
                                                      'Lottie/sunny.json',
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
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        Lottie.asset('Lottie/humidity.json',
                            height: 20, width: 20),
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
                          Lottie.asset(
                              'Lottie/pressure.json',
                              height: 20,
                              width: 20),
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
                          Lottie.asset('Lottie/wind.json',
                              height: 20, width: 20),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

