// WEATHER APP

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ACTIVITY/home.dart';
import 'package:flutter_application_1/ACTIVITY/loading.dart';
//import 'package:flutter_application_1/ACTIVITY/location.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Loading(), // Now acts as the home screen
        "/home": (context) => Home(),
        "/loading": (context) => Loading(),
      },
    ),
  );
}
