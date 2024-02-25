import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class User_model {
  // final String id;
  final String id;
  final String name;
  final String phone;
  // final String uid;

  User_model({
    // required this.id,
    required this.id,
    required this.name,
    required this.phone,
    // required this.uid,
  });
}

class Display_Data extends StatefulWidget {
  @override
  _Display_DataState createState() => _Display_DataState();
}

class _Display_DataState extends State<Display_Data> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  void initState() {
    // getRequest();
    namecontroller = TextEditingController();
    phonecontroller = TextEditingController();

    super.initState();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//Applying get request.

  Future<List<User_model>> getRequest() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userId = _prefs.getString('user_id') ?? ''; // Get the user_id from SharedPreferences


    //replace your restFull API here.
    String url = "$ip_address/Deaf_and_Mute_project/display_contacts.php?uid=$userId";
    print(userId);

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User_model> users = [];
    for (var singleUser in responseData) {
      User_model user = User_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        phone: singleUser["phone"].toString(),
        // uid : singleUser['uid'].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade200,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Contacts",
          ),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: TextFormField(
                  controller: namecontroller,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter name",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  controller: phonecontroller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter phone number",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade400,
                  ),
                  onPressed: ()
                      //async
                      {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        Submit();
                      });
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.grey.shade900,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Existing Contacts",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: FutureBuilder(
                    future: getRequest(),
                    builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: Colors.red.shade900,
                                  strokeWidth: 5,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Data Loading Please Wait!",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) => Column(
                            children: [
                              Card(
                                color: Colors.pink.shade50,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.all(5),
                                          title: Text(
                                            snapshot.data[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          leading: GestureDetector(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.contact_phone,
                                                color: Colors.green.shade900,
                                              )),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data[index].phone,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              GestureDetector(
                                                onTap: (){

                                                  emergency = snapshot.data[index].phone;
                                                  emergency_id = snapshot.data[index].id;
                                                  print("${emergency}");
                                                  print("${emergency_id}");
                                                  setState(() {
                                                    Emergency_No();
                                                  });

                                                  // final snackBar = SnackBar(
                                                  //   content: Text('No Added as Emergency'),
                                                  //   action: SnackBarAction(
                                                  //     label: 'Ok',
                                                  //     onPressed: () {
                                                  //       // Some code to undo the change.
                                                  //     },
                                                  //   ),
                                                  // );
                                                  //
                                                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                },
                                                child: Container(
                                                    height: 20,
                                                    width: 140,
                                                    color: Colors.white,
                                                    child: Center(
                                                      child: Text(
                                                        "Set No as Emergency",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor:
                                                              Colors.blue,
                                                          decorationThickness: 3,
                                                          decorationStyle:
                                                              TextDecorationStyle
                                                                  .solid,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          trailing: GestureDetector(
                                              onTap: () {
                                                launch("tel://" +
                                                    snapshot.data[index].phone);
                                              },
                                              child: Icon(
                                                Icons.call,
                                                color: Colors.teal,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Submit() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userId = _prefs.getString('user_id') ?? ''; // Get the user_id from SharedPreferences

    print(namecontroller.text);
    var APIURL = "$ip_address/Deaf_and_Mute_project/Add_contacts.php";

    // json mapping user entered details
    Map maped_data = {
      'name': namecontroller.text,
      'phone': phonecontroller.text,
      'uid' : userId.toString(),
    };

    // send data using http post to our php code
    http.Response response = await http.post(Uri.parse(APIURL), body: maped_data);

    // Check if response is successful and not empty
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      var data = jsonDecode(response.body);
      var responseError = data["error"];
      print(data);

      if (responseError) {
        // Handle error
      } else {
        namecontroller.clear();
        phonecontroller.clear();

        Fluttertoast.showToast(
            msg: "Contact added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blueGrey);
      }
    } else {
      // Handle empty or unsuccessful response
      print("Empty or unsuccessful response");
    }
  }



  Emergency_No() async {
    final response = await http.post(
        Uri.parse("$ip_address/Deaf_and_Mute_project/add_emergency_no.php"),
        body: {
         // "id":emergency_id,
          "phone": emergency,

        });
    if (response.statusCode == 200) {


      final snackBar = await SnackBar(
        content: const Text('Emergency No Added!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            //Navigator.pop(context);
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print("not");
      final snackBar = await SnackBar(
        content: const Text('Event updation failed!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            //Navigator.pop(context);
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {});
  }
}
