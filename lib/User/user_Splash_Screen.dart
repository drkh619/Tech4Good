import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../main.dart';
import 'User_Home_Page.dart';
import 'user_Login_Page.dart';

var key_value;
var admin_key;

class user_Splash_Screen extends StatefulWidget {
  _user_Splash_ScreenState createState() => _user_Splash_ScreenState();
}

class _user_Splash_ScreenState extends State<user_Splash_Screen> {
  PageController controller = PageController(initialPage: 0);


  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 1), () {
        admin_key == null
            ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Login_Page(controller: controller,)))
            : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => User_HomePage()));
      });
    });
    setState(() {

      Get_Username();
    });

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
    var obtainedemail = await sharedprefs.getString('user_id');
    setState(() {
      admin_key = obtainedemail;
    });
    print('thisis service  value $admin_key');
  }


Get_Username() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtain_admin = await sharedprefs.getString('id');

    setState(() {

    });
  get_username = obtain_admin!;
  }
}
