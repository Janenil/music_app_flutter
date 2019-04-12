import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class SongPage extends StatefulWidget {
  final String songUrl;
  final String songname;
  SongPage(this.songUrl,this.songname);
  _SongPageState createState() => new _SongPageState();
}

class _SongPageState extends State<SongPage> {

  AudioPlayer audioPlayer = new AudioPlayer();
  
  void initState() {
    // AudioPlayer.logEnabled = true;
    super.initState();
    print(widget.songUrl);
    playThisMusic();
  }

  playThisMusic() {
    audioPlayer.play(
      widget.songUrl
    );
  }
  stopThisMusic() {
    audioPlayer.pause();
  }
  
  Widget build(BuildContext context) {
    return  new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.songname,
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 16.0),
          ),
          backgroundColor: Colors.black,
        ),
        body: new Center(
          child: new IconButton(
            icon: Icon(Icons.stop),
            onPressed: () {
              stopThisMusic();
            },
          ),
        )
    );
 
  }
}