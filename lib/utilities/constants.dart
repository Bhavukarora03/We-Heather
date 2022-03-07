import 'package:flutter/material.dart';


const kMessageTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  letterSpacing: 2,
  fontSize: 15,
  fontFamily: 'Spartan MB',
  color: Colors.grey,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  prefixIcon: Icon(

  Icons.location_pin,
  color: Colors.black54,


),
label: Text('Enter the city'),
  labelStyle: TextStyle(color: Colors.grey),
  // hintText: 'Enter the City',
  // hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.zero
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black38, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const KGradientCondtional = LinearGradient(
  stops: [
    0.12,
    0.40,
    0.48,
    0.56,
    0.92,
  ],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF050505),
    Color(0xFF0b1f4b),
    Color(0xFF440909),
    Color(0xFF52300a),
    Color(0xFF000000),
  ],

);
