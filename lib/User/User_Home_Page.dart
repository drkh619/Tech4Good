import 'package:deaf_and_project/Games/Games_main_Page.dart';
import 'package:deaf_and_project/Online%20Class/onlineClass.dart';
import 'package:deaf_and_project/User/faq.dart';
import 'package:deaf_and_project/_Resources/changePassword.dart';
import 'package:deaf_and_project/_Resources/feedback.dart';
import 'package:deaf_and_project/_Resources/sample.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../About_Us.dart';
import '../Learn/Lear_Main_Screen_Display.dart';
import '../_Resources/Resources_Main_Page.dart';
import '../main.dart';
import 'user_Login_Page.dart';

class User_HomePage extends StatefulWidget {
  const User_HomePage({Key? key}) : super(key: key);

  @override
  _User_HomePageState createState() => _User_HomePageState();
}

class _User_HomePageState extends State<User_HomePage> {
  PageController controller = PageController(initialPage: 0);
  // Route<Object?> get route =>
  //     MaterialPageRoute(builder: (BuildContext context) => User_HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Choose a card to get started",
          style: GoogleFonts.cookie(color: Colors.grey.shade600, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                _confirmLogout();
              },
              icon: Icon(Icons.exit_to_app,color: Colors.red.shade900,size: 30,)),
        ],
      ),
      backgroundColor: Colors.blue.shade100,

      drawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(30),
                  //   bottomRight: Radius.circular(30),
                  // ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/avatar.png"),
                      radius: 35,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Welcome, ${get_username}",
                        style: GoogleFonts.poppins(color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.password),
                title: Text(
                  'Change Password',
                  style: GoogleFonts.poppins(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, ),
                title: Text(
                  'Log Out',
                  style: GoogleFonts.poppins(),
                ),
                onTap: () {
                  _confirmLogout();
                },
              ),
              ListTile(
                leading: Icon(Icons.menu_book_outlined, ),
                title: Text(
                  'About Us',
                  style: GoogleFonts.poppins(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sample()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.help, ),
                title: Text(
                  'FAQ',
                  style: GoogleFonts.poppins(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback, ),
                title: Text(
                  'Feedback',
                  style: GoogleFonts.poppins(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Learn_Main_screen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(children: [
                    Image.asset(
                      "assets/main_images/learn.jpg",
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                        top: 15,
                        left: 30,
                        child: Text(
                          "Learn",
                          style: GoogleFonts.courgette(
                              fontSize: 40, color: Colors.blueGrey.shade600),
                        ))
                  ]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),





            InkWell(
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Games_Main_Page()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(children: [
                    Image.asset(
                      "assets/main_images/games.jpg",
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                        top: 15,
                        left: 30,
                        child: Text(
                          "Games",
                          style: GoogleFonts.courgette(
                              fontSize: 40, color: Colors.blueGrey.shade600),
                        ))
                  ]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OnlineClasses()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(children: [
                    Image.asset(
                      "assets/main_images/games.jpg",
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                        top: 15,
                        left: 30,
                        child: Text(
                          "Live Classes",
                          style: GoogleFonts.courgette(
                              fontSize: 40, color: Colors.blueGrey.shade600),
                        ))
                  ]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),


            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Resources_Main_Page()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(children: [
                    Image.asset(
                      "assets/main_images/resources1.jpg",
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                        top: 15,
                        left: 30,
                        child: Text(
                          "Resources",
                          style: GoogleFonts.courgette(
                              fontSize: 40, color: Colors.blueGrey.shade600),
                        ))
                  ]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
  Future<void> _confirmLogout() async {
    print("This is printed!");
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                final SharedPreferences sharedpreferences =
                await SharedPreferences.getInstance();
                sharedpreferences.remove('user_id');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login_Page(controller: controller),
                  ),
                );
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
