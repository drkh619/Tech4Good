import 'package:deaf_and_project/family/sister.dart';
import 'package:deaf_and_project/family/son.dart';
import 'package:deaf_and_project/family/uncle.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

import 'aunt.dart';
import 'baby.dart';
import 'brother.dart';
import 'children.dart';
import 'daughter.dart';
import 'father.dart';
import 'grandfather.dart';
import 'grandmother.dart';
import 'husbandwife.dart';
import 'mother.dart';
import 'niecenephew.dart';

class Family extends StatefulWidget {
  const Family({Key? key}) : super(key: key);

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(
        "assets/Family/family.mp4",
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose(); // Dispose the flick manager when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Family",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
                fontSize: 30,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: FlickVideoPlayer(
                flickManager: flickManager,
              ),
            ),
            SizedBox(
              height: 30,
            ),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [



              InkWell(
                child:Custom_Container("assets/Family/grandfather.jpg","Grandfather"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>grandfather(

                  )));
                },
              ),


              InkWell(
                child:  Custom_Container("assets/Family/grandmother.jpg","Grandmother"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>grandmother()));
                },
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [



              InkWell(
                child:Custom_Container("assets/Family/father.jpg","Father"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>father()));
                },
              ),


              InkWell(
                child:  Custom_Container("assets/Family/mother.jpg","Mother"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>mother()));
                },
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [



              InkWell(
                child:Custom_Container("assets/Family/brother.jpg","Brother"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>brother()));
                },
              ),


              InkWell(
                child:  Custom_Container("assets/Family/sister.jpg","sister"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>sister()));
                },
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [



              InkWell(
                child:Custom_Container("assets/Family/aunt.jpg","Aunt"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>aunt()));
                },
              ),


              InkWell(
                child:  Custom_Container("assets/Family/uncle.jpg","Uncle"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>uncle()));
                },
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [



              InkWell(
                child:Custom_Container("assets/Family/husband_wife.jpg","Husband and Wife"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>husbandwife()));
                },
              ),


              InkWell(
                child:  Custom_Container("assets/Family/nephew-niece.jpg","nephew & niece"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>niecenephew()));
                },
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [



              InkWell(
                child:Custom_Container("assets/Family/cousins.jpg","Children"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>children()));
                },
              ),


              InkWell(
                child:  Custom_Container("assets/Family/baby1.jpg","Baby"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>baby()));
                },
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [



              InkWell(
                child:Custom_Container("assets/Family/daughter.jpg","Daughter"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>daughter()));
                },
              ),


              InkWell(
                child:  Custom_Container("assets/Family/son.jpg","Son"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>son()));
                },
              ),


            ],
          ),
        ],
      ),




    ],
      ),
    ),
    );

    }


  Custom_Container(String url,String title) {
    return Container(
      height: 175,
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
     ]
    ),
    );
  }
}



