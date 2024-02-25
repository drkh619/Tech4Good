import 'package:flutter/material.dart';

import 'Main_Screen/Main_Screen.dart';
var ip_address ="http://192.168.18.85"; //integos
// var ip_address ="https://deafandmuteapp.000webhostapp.com"; //online
// var ip_address ="http://192.168.29.104"; //home
var get_username='';

var emergency;
var emergency_id;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MainScreen(),
    );
  }
}


