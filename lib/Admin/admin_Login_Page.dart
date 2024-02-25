import 'dart:convert';

import 'package:deaf_and_project/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Admin_Home_Page.dart';
import 'admin_Registration_Page.dart';

class admin_Login_Page extends StatefulWidget {
  const admin_Login_Page({Key? key}) : super(key: key);

  @override
  _admin_Login_PageState createState() => _admin_Login_PageState();
}

class _admin_Login_PageState extends State<admin_Login_Page> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 200,),

            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: username,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      onSaved: (username) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // labelText: 'Email',
                          hintText: 'username'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      style: TextStyle(),
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade400,
                ),
                onPressed: ()
                //async
                {
                  setState(() {
                    admin_Login();
                  });

                  if (formkey.currentState!.validate()) {
                 //   print("session id is $key_value");

                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User?',
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>   admin_Registration_Page()));

                    },
                    child: Text("Create Account"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future admin_Login() async {
    var url = "http://$ip_address/Deaf_and_Mute_project/Admin/admin_login.php";
    var response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json'
    }, body: {
      "username": username.text,
      "password": password.text,
    });

    var data = json.decode(response.body);
    // if (data.toString() == "Success") {
    if (data != null) {
      //var responseData = json.decode(response.body);

      for (var singleUser in data) {
        final SharedPreferences sharedpreferences =
        await SharedPreferences.getInstance();

        await sharedpreferences.setString('admin_id', singleUser["id"]);

      }

      final snackBar = SnackBar(
        content: Text('Login Successfull'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Admin_HomePage()));
    } else {
      final snackBar = SnackBar(
        content: Text('Username and password invalid'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}


