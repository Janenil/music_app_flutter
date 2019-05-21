import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../data/album.dart';
import 'dart:ui';
import './lyric/getLyric.dart';
import './player/index.dart';
import '../topAlbumPage/data.dart';
class SongPage extends StatefulWidget {
  final String songUrl;
  final String songname;
  final TopSongList list;
  SongPage(this.songUrl,this.songname, this.list);
  _SongPageState createState() => new _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool isSongPage = true;
  String url;
  String name;
  TopSongList _list;
  AudioPlayer audioPlayer = new AudioPlayer();
  void initState() {
    // AudioPlayer.logEnabled = true;
    super.initState();
    print(widget.songUrl);
    setState(() {
      url =  widget.songUrl;
      name = widget.songname;
      _list = widget.list;
    });
    // playThisMusic();
  }
  
  stopThisMusic() {
    audioPlayer.pause();
  }
  onNext() {
    print('next');
    // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context,) => new SongPage('https${songinfo[i].purl.substring(4,songinfo[i].purl.length)}', list[i].songname, list[i])))
    setState(() {
      url =  'https://dl.stream.qqmusic.qq.com/C400002McnY72XZVaG.m4a?guid=1946938565&vkey=A80A3B0B841BE25BD25E6E0F3BCDA382DC5561AF973D989BC1E10031CDF888318B19B3085B73D76928D566A0F1CFE678B59BF25EA561A1AF&uin=0&fromtag=38';
      name = '123';
      _list = widget.list;
    });
    print('next123');

  }
  onPrevious() {
    print('previous');
  }
  onError(err) {
    print('something is wrong');
  }
  onCompleted() {
    print('completed');
  }
  Widget _content() {
    double width = MediaQuery.of(context).size.width;
    if( this.isSongPage == true) {
      return new GestureDetector(
        onTap: () => setState((){this.isSongPage = false;}),
        child: new Container(
          height: 0.8 * width,
          width: 0.8 * width,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 10, //                   <--- border width here
            ),
            image: new DecorationImage(
              image: new NetworkImage('https://y.gtimg.cn/music/photo_new/T002R300x300M000${widget.list.data.albummid}.jpg?max_age=2592000'),
              fit: BoxFit.cover,
            ),
          ),
          child: null
        )
      );
    } else {
      return new GestureDetector(
        onTap: () => setState((){this.isSongPage = true;}),
        child: new Container(
          height: 0.8 * width,
          width: 0.8 * width,
          decoration: new BoxDecoration(
            color: Colors.yellow
          ),
          child:new Text('datas',style: TextStyle(color:  Colors.white)),
        )
      );
    }
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
        // body: new Container(
        //   padding: const EdgeInsets.only(top: 10.0),
        //   decoration: BoxDecoration(
        //     image: new DecorationImage(
        //       image: new NetworkImage(
        //         'https://y.gtimg.cn/music/photo_new/T002R300x300M000${widget.list.albummid}.jpg?max_age=2592000'
        //       ),
        //       colorFilter: new ColorFilter.mode(Colors.black54.withOpacity(0.95), BlendMode.darken),//滤镜
        //       // colorFilter: new ColorFilter.mode(
        //       //   Colors.black54,
        //       //   BlendMode.overlay,
        //       // ),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   child: new Column(
        //     children: [
        //       new Center(
        //         child:new Text(widget.list.singer[0].name,
        //         style: TextStyle(
        //           color: Colors.yellow,
        //           fontSize: 16.0
        //         ),)
        //       ),
        //       _content(),
        //       new IconButton(
        //         icon: Icon(Icons.stop),
        //         color: Colors.yellow,
        //         onPressed: () {
        //           stopThisMusic();
        //         },
        //       ),
        //     ]
        //   ),
        // )
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(
                    'https://y.gtimg.cn/music/photo_new/T002R300x300M000${widget.list.data.albummid}.jpg?max_age=2592000'
                  ),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                    Colors.black54,
                    BlendMode.overlay,
                  ),
                ),
              ),
            ),
            new Container(
              child: new BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Opacity(
                  opacity: 0.6,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              )
            ),
            new Column(
              children: <Widget>[
                new Center(
                  child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      widget.list.data.singer[0].name,
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(0, 35.0, 0, 35.0),
                  child: _content(),
                ),
                // new Text("${widget.list.songid}"),
                Player(
                  songUrl:this.url, 
                  songname:this.name, 
                  list:this._list,
                  onCompleted:this.onCompleted,
                  onError:this.onError,
                  onNext:this.onNext,
                  onPrevious:this.onPrevious,
                  volume:1.0
                )
              ],
            )
          ],
        ),
    );
  }
}