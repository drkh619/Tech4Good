import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class goodbye extends StatefulWidget {
  const goodbye({Key? key}) : super(key: key);

  @override
  State<goodbye> createState() => _goodbyeState();
}

class _goodbyeState extends State<goodbye> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(
        "assets/greetings/goodbye.mp4",
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
              "goodbye & see you later",
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
          ],
        ),
      ),
    );
  }
}
