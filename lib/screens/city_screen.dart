//
// import 'package:flutter/material.dart';
// import 'package:clima/utilities/constants.dart';
// import 'package:lottie/lottie.dart';
//
// class CityScreen extends StatefulWidget {
//   static const id = 'CityScreen';
//   @override
//   _CityScreenState createState() => _CityScreenState();
// }
//
// class _CityScreenState extends State<CityScreen> {
//   String cityName;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: MaterialButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.arrow_back_ios,
//                       size: 30.0, color: Colors.black54),
//                 ),
//               ),
//               Flexible(
//                   child: Lottie.network(
//                       'https://assets6.lottiefiles.com/private_files/lf30_ykaw8ptl.json')),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextField(
//                   showCursor: true,
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                   decoration: kTextFieldInputDecoration.copyWith(),
//                   onChanged: (value) {
//                     cityName = value;
//                   },
//                 ),
//               ),
//               Flexible(
//                 child: Material(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(5.0),
//                   elevation: 10.0,
//                   child: MaterialButton(
//                     onPressed: () {
//                       Navigator.pop(context, cityName);
//                     },
//                     child: Text(
//                       'Get Weather',
//                       style: kButtonTextStyle,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
