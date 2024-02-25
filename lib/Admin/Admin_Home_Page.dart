import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_Login_Page.dart';



class Admin_HomePage extends StatefulWidget {
  const Admin_HomePage({Key? key}) : super(key: key);

  @override
  _Admin_HomePageState createState() => _Admin_HomePageState();
}

class _Admin_HomePageState extends State<Admin_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("admin Home Page"),
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences sharedpreferences =
                await SharedPreferences.getInstance();
                sharedpreferences.remove('admin_id');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => admin_Login_Page()));
              },
              icon: Icon(Icons.exit_to_app)),

        ],
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
