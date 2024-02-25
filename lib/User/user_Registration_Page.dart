import 'dart:convert';

import 'package:deaf_and_project/User/User_Home_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'user_Login_Page.dart';


class user_Registration_Page extends StatefulWidget {
  const user_Registration_Page({super.key, required this.controller});
  final PageController controller;

  @override
  _user_Registration_PageState createState() => _user_Registration_PageState();
}

class _user_Registration_PageState extends State<user_Registration_Page> {
  PageController controller = PageController(initialPage: 0);

  TextEditingController _username = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _phone = TextEditingController();

  TextEditingController _password = TextEditingController();

  TextEditingController _confirmpassword = TextEditingController();

  late bool status;

  late String message;

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();

    status = false;
    message = "";

    super.initState();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  bool _isPasswordValid = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordOneUpperAndSymbol = false;


  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final uppercaseRegex = RegExp(r'[A-Z]');
    final symbolRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;

      _hasPasswordOneUpperAndSymbol = false;
      if (uppercaseRegex.hasMatch(password) &&
          symbolRegex.hasMatch(password)) {
        _hasPasswordOneUpperAndSymbol = true;
      }

      _isPasswordValid = _isPasswordEightCharacters &&
          _hasPasswordOneNumber &&
          _hasPasswordOneUpperAndSymbol;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset(
                "assets/images/vector-2.png",
                width: 428,
                height: 457,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Color(0xFF755DC1),
                      fontSize: 27,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 56,
                    child: TextField(
                      controller: _username,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF393939),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF837E93),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF9F7BFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    height: 56,
                    child: TextField(
                      controller: _email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF393939),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF837E93),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF9F7BFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    height: 56,
                    child: TextField(
                      controller: _phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF393939),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Phone',
                        prefix: Text("+91 "),
                        hintStyle: TextStyle(
                          color: Color(0xFF837E93),
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF837E93),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF9F7BFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: TextFormField(
                            controller: _password,
                            keyboardType: TextInputType.text,
                            // focusNode: _passwordFocus,
                            onChanged: (password) {
                              onPasswordChanged(password);
                            },
                            style: const TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            // onTap: () => _scrollToField(_passwordFocus),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a Password";
                              }
                              return null;
                            },
                            onSaved: (name) {},
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Color(0xFF755DC1),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Color(0xFF837E93),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF9F7BFF),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                child: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: TextFormField(
                            controller: _confirmpassword,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter re-password";
                              }
                              if (_password.text != _confirmpassword.text) {
                                return "Password Do not match";
                              }
                              return null;
                            },
                            onSaved: (name) {},
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                color: Color(0xFF755DC1),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Color(0xFF837E93),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF9F7BFF),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Color(0xFF837E93),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _isPasswordEightCharacters
                                ? Colors.green
                                : Colors.transparent,
                            border: _isPasswordEightCharacters
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(Icons.check,
                                color: Colors.white, size: 15),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("Contains at least 8 characters"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _hasPasswordOneNumber
                                ? Colors.green
                                : Colors.transparent,
                            border: _hasPasswordOneNumber
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(Icons.check,
                                color: Colors.white, size: 15),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("Contains at least 1 number"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _hasPasswordOneUpperAndSymbol
                                ? Colors.green
                                : Colors.transparent,
                            border: _hasPasswordOneUpperAndSymbol
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(Icons.check,
                                color: Colors.white, size: 15),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(child: Text("Contains at least 1 Uppercase and Symbol")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: 329,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isPasswordValid
                            ? () {
                          setState(() {
                            user_Registration();
                          });
                          Fluttertoast.showToast(
                              msg: 'Registration successfull ',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blueGrey);
                          if (formkey.currentState!.validate()) {

                            _username.clear();
                            _email.clear();
                            _phone.clear();
                            _password.clear();
                            _confirmpassword.clear();
                          }
                        } : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9F7BFF),
                        ),
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Already have an account?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF837E93),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 2.5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>   Login_Page(controller: controller,)));
                        },
                        child: const Text(
                          'Log In ',
                          style: TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 18,)
                    ],
                  ),
                  SizedBox(height: 25,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future user_Registration() async {
    var APIURL = "$ip_address/Deaf_and_Mute_project/User/user_Registration.php";

    //json maping user entered details
    Map mapeddate = {
      'username': _username.text,
      'email': _email.text,
      'phone': _phone.text,
      'password': _password.text
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];
    print("DATA: ${data}");
    if (responseError) {
      setState(() {
        status = false;
        message = responseMessage;
      });
      Fluttertoast.showToast(
          msg: 'email and password already exists try another! ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          webPosition: 1,
          backgroundColor: Colors.blueGrey);
    } else {
      _username.clear();
      _email.clear();
      _phone.clear();
      _password.clear();
      _confirmpassword.clear();

      setState(() {
        status = true;
        message = responseMessage;
      });

      Fluttertoast.showToast(
          msg: 'Registration successfull ',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }

    print("DATA: ${data}");
  }
}

