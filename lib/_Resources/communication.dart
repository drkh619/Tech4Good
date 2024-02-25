import 'package:flutter/material.dart';
import 'package:flutter_fancy_container/flutter_fancy_container.dart';
import 'package:google_fonts/google_fonts.dart';


class communication extends StatefulWidget {
  const communication({Key? key}) : super(key: key);

  @override
  State<communication> createState() => _communicationState();
}

class _communicationState extends State<communication> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(flex: 2, child: Container(color: Theme.of(context).brightness == Brightness.dark ? Colors.purple.shade500 : Colors.teal.shade500)),
            Expanded(child: Container(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF121212) : Colors.white)),
          ],
        ),
        Align(
          alignment: Alignment(0, 0.2),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 12,
              child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'assets/main_images/about us.jpg',
                          height: 150,
                          width: 150,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Communication Tips",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            ' Communication with deaf and mute people can be challenging, but there are some tips that can help you interact with them more effectively. Here are some of them::\n\n'
                                '•  Get their attention before speaking. You can do this by tapping their shoulder, waving your hand, or flashing a light..\n'
                                '•  Face them and maintain eye contact. This will help them see your facial expressions and lip movements, which are important cues for communication.\n'
                                '•  Check the background noise and lighting. Avoid loud noises and dark shadows that can interfere with their ability to hear and see you.\n'
                                '•  Use a combination of sign language, written communication, and assistive technology.\n'
                                '•  Depending on their preferences and needs, you can use different methods to communicate with them, such as sign language, notes, pictures, apps, or devices.\n'
                                '•  Be patient and respectful. Do not shout, exaggerate, or assume what they are saying. Ask them to repeat or clarify if you do not understand, and confirm that they understand you as well.\n'
                                '•  We hope these tips help you communicate with deaf and mute people better.\n'

                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}






