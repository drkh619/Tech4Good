
import 'package:deaf_and_project/Learn/colours.dart';
import 'package:deaf_and_project/Learn/greetings.dart';
// import 'package:deaf_and_project/Learn/letters.dart';
import 'package:deaf_and_project/Learn/letters.dart.';
import 'package:deaf_and_project/Learn/numbers.dart';
import 'package:deaf_and_project/Learn/week.dart';
import 'package:deaf_and_project/family/family.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'months.dart';



class Learn_Main_screen extends StatefulWidget {
  const Learn_Main_screen({Key? key}) : super(key: key);

  @override
  _Learn_Main_screenState createState() => _Learn_Main_screenState();
}

class _Learn_Main_screenState extends State<Learn_Main_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Deaf  & dumb Learning',
          style: TextStyle(fontSize: 25, color: Colors.teal),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.8 / 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 40),
        children: [
          InkWell(
            child:  Custom_Container("assets/main_images/alphabets.jpg","Alphabets"),
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>letters()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/main_images/numbers.jpg","Numbers"),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>numbers()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/main_images/months.jpg","Months"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>months()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/main_images/weeks.jpg","weeks"),
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>week()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/main_images/colours.jpg","Colors"),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>colours()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/main_images/greetings.jpg","Greetings"),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>greetings()));
            },
          ),

          InkWell(
            child:  Custom_Container("assets/main_images/family.jpg","Family"),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Family()));
            },
          ),
        ],
      ),
    );
  }


  Custom_Container(String url,String title) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black26),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
                fontSize: 20),
          ),
          SizedBox(height: 120, child: Image(image: AssetImage(url))),
        ],
      ),
    );
  }
}
