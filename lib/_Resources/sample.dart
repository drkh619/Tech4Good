import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class sample  extends StatefulWidget {
  const sample ({Key? key}) : super(key: key);

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
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
    "Tech4Good",
    style: GoogleFonts.alexandria(
    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
    fontSize: 30.0,
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
    ' Welcome to Tech4Good – Empowering Connections, Transforming Lives!:\n\n'
    '•  Our app Tech4Good aims at helping people who are hard of hearing and mute/speech-impaired people through an interactive way.This app can also be used by people who want to learn sign-language.\n'
    '•  It is user-friendly and easy to understand so people of any age-group can use this effeciently..\n'
    '• The app provides quizes based on what you have learnt which helps you to test your knowledge and improve your performance accordingly.\n'
    '•  In addition, this app also aims at helping the parents of such kids by providing them guidlines as well as communication tips and ettiquettes which will help you to interact with them comfortably without worrying about hurting them.\n'
    '•  Our app also includes an emergency feature in case of emergencies as well as a text to speech converter for easy communication with people who have no idea about sign language.\n\n\n'
    '            *** USER GUIDLINES ***\n\n'
    '• After you have succefully logged in, you will be able to see three sections.\n'
    '• The first section is the learning section.In that section you will learn basics such as letters, numbers, weeks, months ,greeting and family members in sign language.\n'
    '•After completing the learn section you can move onto the next section which is games.In this section we have included quiz.This section is further divided into three sections:\ni. Alphabets\nii. Greetings\niii.Challenge\n'
    '•The third section is the resources which includes:\ni. communication tips\nii. ettiquettes\niii. emergency feature\niv. speech to text converterv guildlines for parents.'
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









