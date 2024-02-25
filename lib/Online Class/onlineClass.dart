import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class OnlineClasses extends StatefulWidget {
  @override
  _OnlineClassesState createState() => _OnlineClassesState();
}

class _OnlineClassesState extends State<OnlineClasses> {
  final String apiUrl =
      '$ip_address/Deaf_and_Mute_project/User/view_all_class.php'; // Replace 'your-php-url' with your actual PHP URL

  Future<List<dynamic>> fetchOnlineClasses() async {
    var result = await http.get(Uri.parse(apiUrl));
    var classes = json.decode(result.body);
    var filteredClasses = classes.where((classData) {
      var classDate = DateTime.parse(classData['class_date']);
      return classDate.isAfter(DateTime.now().subtract(Duration(days: 1))); // Include classes for today and future
    }).toList();
    return filteredClasses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Classes', style: GoogleFonts.poppins()),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: fetchOnlineClasses(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var filteredClasses = snapshot.data.where((classData) {
                var classDate = DateTime.parse(classData['class_date']);
                var today = DateTime.now();
                var todayMidnight = DateTime(today.year, today.month, today.day);
                return !classDate.isBefore(todayMidnight); // Exclude today's classes
              }).toList();
              return ListView.builder(
                itemCount: filteredClasses.length,
                itemBuilder: (BuildContext context, int index) {
                  var classDate = DateTime.parse(filteredClasses[index]['class_date']);
                  var formattedDate = "${classDate.day.toString().padLeft(2, '0')}-${classDate.month.toString().padLeft(2, '0')}-${classDate.year.toString()}";
                  var classTime = filteredClasses[index]['class_time'];
                  var timeParts = classTime.split(':');
                  var hour = int.parse(timeParts[0]);
                  var minute = int.parse(timeParts[1]);
                  var period = hour < 12 ? 'AM' : 'PM';
                  hour = hour % 12;
                  hour = hour == 0 ? 12 : hour;
                  var formattedTime = '$hour:${minute.toString().padLeft(2, '0')} $period';
                  var isDisabled = classDate.isAfter(DateTime.now());
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Text(
                        filteredClasses[index]['class_name'],
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'Date: $formattedDate',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Time: $formattedTime',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Tutor: ${filteredClasses[index]['teacher_name']}',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Description: ${filteredClasses[index]['class_description']}',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: isDisabled ? null : () async {
                          String _url = filteredClasses[index]['class_link'];
                          if (!await launch(
                            _url, forceWebView: false,
                            //forceSafariVC: false,
                            enableJavaScript: true,
                          )) throw 'Could not launch $_url';
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isDisabled ? Colors.grey : Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Join Now', style: GoogleFonts.poppins(color: Colors.white)),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
