import 'package:flutter/material.dart';




const kMessageTextStyle = TextStyle(

  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
icon: Icon(Icons.location_pin,size: 40.0,),
  hintText: 'Enter the City',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.black38, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const KGradientCondtional = LinearGradient(

begin: Alignment.topCenter,
end: Alignment.centerRight,
colors: <Color>[
Colors.blueGrey,
Colors.white
]);



