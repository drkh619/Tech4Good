// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../main.dart';
//
// class User_model {
//   // final String id;
//   final String id;
//   final String name;
//   final String phone;
//
//   User_model({
//     // required this.id,
//     required this.id,
//     required this.name,
//     required this.phone,
//   });
// }
//
// class Display_Data extends StatefulWidget {
//   @override
//   _Display_DataState createState() => _Display_DataState();
// }
//
// class _Display_DataState extends State<Display_Data> {
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController phonecontroller = TextEditingController();
//
//   @override
//   void initState() {
//     // getRequest();
//     namecontroller = TextEditingController();
//     phonecontroller = TextEditingController();
//
//     super.initState();
//   }
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
// //Applying get request.
//
//   Future<List<User_model>> getRequest() async {
//     //replace your restFull API here.
//     String url = "http://$ip_address/Deaf_and_Mute_project/display_contacts.php";
//
//     final response = await http.get(Uri.parse(url));
//
//     var responseData = json.decode(response.body);
//
//     //Creating a list to store input data;
//     List<User_model> users = [];
//     for (var singleUser in responseData) {
//       User_model user = User_model(
//         //id:  singleUser["id"].toString(),
//         id: singleUser["id"].toString(),
//         name: singleUser["name"].toString(),
//         phone: singleUser["phone"].toString(),
//       );
//
//       //Adding user to the list.
//       users.add(user);
//     }
//     return users;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.teal.shade200,
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           title: Text(
//             "Contacts",
//           ),
//         ),
//         body: Form(
//           key: _formkey,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 40,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25,
//                 ),
//                 child: TextFormField(
//                   controller: namecontroller,
//                   textCapitalization: TextCapitalization.sentences,
//                   keyboardType: TextInputType.text,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                         ),
//                       ),
//                       hintText: "Enter name",
//                       hintStyle: TextStyle(color: Colors.black),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       )),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: TextFormField(
//                   controller: phonecontroller,
//                   keyboardType: TextInputType.number,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                         ),
//                       ),
//                       hintText: "Enter phone number",
//                       hintStyle: TextStyle(color: Colors.black),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 15,
//                 width: MediaQuery.of(context).size.width / 1.3,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.grey.shade400,
//                   ),
//                   onPressed: ()
//                       //async
//                       {
//                     if (_formkey.currentState!.validate()) {
//                       setState(() {
//                         Submit();
//                         namecontroller.clear();
//                         phonecontroller.clear();
//                       });
//                     }
//                   },
//                   child: Text(
//                     'Submit',
//                     style: TextStyle(color: Colors.white, fontSize: 35),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30,),
//               Divider(color: Colors.grey.shade900,),
//
//               SizedBox(height: 30,),
//
//               Text("Existing Contacts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
//
//
//
//               Flexible(
//                 child: Container(
//                   padding: EdgeInsets.all(16.0),
//                   child: FutureBuilder(
//                     future: getRequest(),
//                     builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//                       if (snapshot.data == null) {
//                         return Container(
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CircularProgressIndicator(
//                                   color: Colors.red.shade900,
//                                   strokeWidth: 5,
//                                 ),
//                                 SizedBox(
//                                   height: 30,
//                                 ),
//                                 Text(
//                                   "Data Loading Please Wait!",
//                                   style: TextStyle(),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       } else {
//                         return ListView.builder(
//                           itemCount: snapshot.data.length,
//                           itemBuilder: (ctx, index) => Column(
//                             children: [
//                               Card(
//                                 color: Colors.pink.shade50,
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(1.0),
//                                         child: ListTile(
//                                           title: Text(
//                                             snapshot.data[index].name,style: TextStyle(fontWeight: FontWeight.bold),
//                                           ),
//                                           leading: GestureDetector(
//                                               onTap: () {},
//                                               child: Icon(
//                                                 Icons.contact_phone,
//                                                 color: Colors.green.shade900,
//                                               )),
//                                           subtitle: Text(
//                                             snapshot.data[index].phone,style: TextStyle(fontWeight: FontWeight.bold),
//                                           ),
//                                           trailing: GestureDetector(
//                                               onTap: () {
//                                                 launch("tel://"+snapshot.data[index].phone);
//                                               },
//                                               child: Icon(
//                                                 Icons.call,
//                                                 color: Colors.red.shade900,
//                                               )),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                             ],
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future Submit() async {
//     var APIURL = "http://$ip_address/Deaf_and_Mute_project/Add_contacts.php";
//
//     //json maping user entered details
//     Map maped_data = {
//       'name': namecontroller.text,
//       'phone': phonecontroller.text,
//     };
//     //send  data using http post to our php code
//     http.Response reponse =
//         await http.post(Uri.parse(APIURL), body: maped_data);
//
//     //getting response from php code, here
//     var data = jsonDecode(reponse.body);
//     var responseMessage = data["message"];
//     var responseError = data["error"];
//
//     // print("DATA: ${data}");
//     print(data);
//
//     if (responseError) {
//       setState(() {});
//     } else {
//       namecontroller.clear();
//       phonecontroller.clear();
//
//       setState(() {});
//       Fluttertoast.showToast(
//           msg: "Contact added",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.blueGrey);
//     }
//   }
// }
