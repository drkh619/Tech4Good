import 'package:deaf_and_project/Learn/good.dart';
import 'package:deaf_and_project/Learn/goodbye.dart';
import 'package:deaf_and_project/Learn/goodmorning.dart';
import 'package:deaf_and_project/Learn/hii.dart';
import 'package:deaf_and_project/Learn/howareyou.dart';
import 'package:deaf_and_project/Learn/takecare.dart';
import 'package:flutter/material.dart';

class greetings extends StatefulWidget {
  const greetings({Key? key}) : super(key: key);

  @override
  State<greetings> createState() => _greetingsState();
}

class _greetingsState extends State<greetings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Greetings',
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
            child:  Custom_Container("assets/greetings/goodbye.jpg","Goodbye"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>goodbye()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/greetings/good.jpg","Good/well"),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>good()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/greetings/takecare.jpg","Takecare"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>takecare()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/greetings/hii_hello.jpg","Hii/hello"),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>hii()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/greetings/goodmorning_night.jpg","Good Morning"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>goodmorning()));
            },
          ),
          InkWell(
            child:  Custom_Container("assets/greetings/how_are_you.jpg","How are you"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>howareyou()));
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

