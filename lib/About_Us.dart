import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About_Us extends StatefulWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(flex: 2, child: Container(color: Colors.pink.shade800)),
            Expanded(child: Container(color: Colors.white)),
          ],
        ),
        Align(
          alignment: Alignment(0, 0.2),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 12,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      "assets/main_images/about us.jpg",
                      height: 80,
                      width: 70,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        'Scanner is an online payment app,through this app people can avoid the difficulties of long queue for paying bills.easily they can scan the Qr code and pay the bill through online.',
                        textAlign: TextAlign.justify,
                        //style: TextStyle(fontSize: 15),
                        style: GoogleFonts.sourceCodePro(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
