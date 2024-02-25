import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Admin_Home_Page.dart';
import 'admin_Login_Page.dart';


var admin_key;

class admin_Splash_Screen extends StatefulWidget {
  _admin_Splash_ScreenState createState() => _admin_Splash_ScreenState();
}

class _admin_Splash_ScreenState extends State<admin_Splash_Screen> {


  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 1), () {
        admin_key == null
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => admin_Login_Page()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Admin_HomePage()));
      });
    });
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Loading......",
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }


  Future getValidationData() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('admin_id');
    setState(() {
      admin_key = obtainedemail;
    });
    print('thisis service  value $admin_key');
  }
}
