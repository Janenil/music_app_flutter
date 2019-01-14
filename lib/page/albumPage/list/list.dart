import 'package:flutter/material.dart';
import '../../../data/album.dart';
// import 'package:music_app/util/httpController.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:music_app/data/songInfo.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayer/audioplayer.dart';
class AlbumList extends StatefulWidget {
  final List<SongList> songList;
  AlbumList(this.songList);
  _AlbumListState createState() => new _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  AudioPlayer audioPlayer = new AudioPlayer();
  String res;
  List<String> songmid = [];
  List<int> songtype = [];
  dynamic comm = {
    "g_tk":5381,
    "inCharset":"utf-8",
    "outCharset":"utf-8",
    "notice":0,
    "format":"json",
    "platform":"h5",
    "needNewCode":1,
    "uin":0
  };

  getParam(list,list1,Map<String, dynamic> obj1) {
    Map obj = {};
    Map temp = {
          "module":"vkey.GetVkeyServer",
          "method":"CgiGetVkey",
          "param":{
              "guid":"3441935786",
              "songmid": list,
              "songtype":list1,
              "uin":"0",
              "loginflag":0,
              "platform":"23"
          }
      
    };
    obj = {
      'comm': obj1,
      'url_mid': temp
    };
    return obj;
  }
 


  void initState() {
    // AudioPlayer.logEnabled = true;
    super.initState();
    if (widget.songList != null) {
      getkey();
    }
    if (songmid.length != 0) {
      _loadsongUrl();
    }
  }

  // play(url) async {
  //   int result = await audioPlayer.play(url);
  //   if (result == 1) {
  //     // success
  //     print('success');
  //   } else {
  //     print('false');
  //   }
  // }

  getkey() {
    widget.songList.forEach((item){
      songmid.add(item.songmid);
      songtype.add(0);
    });
  }

  _loadsongUrl () async{
    await apiRequest('http://ustbhuangyi.com/music/api/getPurlUrl',getParam(songmid , songtype, comm));
    final jsonRes = json.decode(res);
    SongInfo info = new SongInfo.fromJson(jsonRes);
    await audioPlayer.play(
      info.urlMid.data.midurlinfo[0].purl
    );
    print(info.urlMid.data.midurlinfo[0].purl);
    print('--------');
    // play(info.urlMid.data.midurlinfo[0].purl);
   

  }


  // post请求
  Future<String> apiRequest(String url, Map jsonMap) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    setState(() {
      res = reply;
    });
    return reply;
  }

  Widget listViewDefault(List<SongList> list) {
    double width = MediaQuery.of(context).size.width;
    List<Widget> _list = new List();
    for (int i = 0; i < list.length; i++) {
      _list.add(
         new GestureDetector(
           onTap: () => print('123'),
           child:new Container(
              padding: const EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
              decoration: new BoxDecoration(
                color: Colors.black
              ),
              height: 80.0,
              width: width,
              child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                    new Text(
                      list[i].songname, 
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )
                    ),
                    new Text(
                      list[i].singer[0].name +'·' +list[i].albumname,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0
                      )
                    )
               ],
             )
           )
         )
      );
    }

    return new Expanded(
      child: new SingleChildScrollView(
        child: new Column(
          children: _list,
        ),
      )
    );
 
  }


  Widget build(BuildContext context) {
    return listViewDefault(widget.songList);
  }
}