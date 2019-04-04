import 'package:flutter/material.dart';

class SongPage extends StatefulWidget {
  final String songUrl;
  final String songname;
  SongPage(this.songUrl,this.songname);
  _SongPageState createState() => new _SongPageState();
}

class _SongPageState extends State<SongPage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home:  new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.songname,
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 16.0),
          ),
          backgroundColor: Colors.black,
        ),
        body: new Column(

        )
        )
    );
 
  }
}