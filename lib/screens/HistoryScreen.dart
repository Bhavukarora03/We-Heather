import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {

  static const id = "HistoryScreen";

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("HISTORICAL DATA"),

      ),
          body: Stack(

    ),
    );
  }
}
