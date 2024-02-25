import 'dart:async';
import 'package:deaf_and_project/Onboardingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Admin/admin_Splash_Screen.dart';
import '../User/user_Splash_Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to user_Splash_Screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => OnboardingPage1(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF9da1a0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height / 14,
                // child: Text(
                //
                //   "Tech4Good",
                //   style: GoogleFonts.sourceSerif4(
                //     fontSize: 50,
                //     color: Colors.red.shade900,
                //   ),
                // ),
              ),
              // Text(
              //   "Innovative App For Deaf & Dumb",
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Colors.teal.shade600,
              //   ),
              // ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 450,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: AssetImage("assets/Pages/main.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              //   child: SizedBox(
              //     width: 330.0,
              //     height: 70.0,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.red.shade200,
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           SizedBox(
              //             height: MediaQuery.of(context).size.height / 2,
              //             width: MediaQuery.of(context).size.width / 7,
              //             child: Container(
              //               height: MediaQuery.of(context).size.height / 2,
              //               width: MediaQuery.of(context).size.width / 7,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(6),
              //                 image: DecorationImage(
              //                   image: AssetImage("assets/user.png"),
              //                   fit: BoxFit.contain,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Spacer(),
              //           Text(
              //             'Get Started',
              //             style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.w700,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ],
              //       ),
              //       onPressed: () {
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (BuildContext context) =>
              //                 user_Splash_Screen(),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
