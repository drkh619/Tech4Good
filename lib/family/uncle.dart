import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';


class uncle extends StatefulWidget {
  const uncle({Key? key}) : super(key: key);

  @override
  State<uncle> createState() => _uncleState();
}

class _uncleState extends State<uncle> {
  final FlickManager flickmanager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(
          "assets/Family/uncle.mp4"));

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
            Text("Uncle", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
                fontSize: 30),),
            Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 3.5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Colors.red,
                child: FlickVideoPlayer(
                  flickManager: flickmanager,
                )),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}