import 'package:flutter/material.dart';
import '../../../data/album.dart';
// import 'package:music_app/util/httpController.dart';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:async';
import 'package:music_app/data/songInfo.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayer/audioplayer.dart';
import '../data.dart';
import '../../singersongPage/song.dart';
class AlbumList extends StatefulWidget {
  final List<SongInstance> songList;
  final String singername;
  AlbumList(this.songList,this.singername);
  _AlbumListState createState() => new _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  AudioPlayer audioPlayer = new AudioPlayer();
  String res;
  Response response;
  Dio dio = new Dio();
  List<String> songmid = [];
  List<UrlInfo> songinfo = [];
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
              "guid":"1946938565",
              "songmid": list,
              "songtype":list1,
              "uin":"0",
              "loginflag":0,
              "platform":"23"
          }
    };
    obj = {
      'comm': obj1,
      'req_0': temp
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

  play(url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
      print('success');
    } else {
      print('false');
    }
  }

  getkey() {
    widget.songList.forEach((item){
      songmid.add(item.musicData.songmid);
      songtype.add(0);
    });
  }

  _loadsongUrl () async{
    await apiRequest('http://ustbhuangyi.com/music/api/getPurlUrl',getParam(songmid , songtype, comm));
    // print(getParam(songmid , songtype, comm));
    // print(songmid);
    // print(songtype);
    print(res);
    // var str = res.substring(7, res.length);
    // print(str);
    final jsonRes = jsonDecode(res);
    SongInfo info = new SongInfo.fromJson(jsonRes);
    // await audioPlayer.play(
    //   info.req.data.midurlinfo[0].purl
    // );
    // print(info.req.data.midurlinfo[0].purl);
    
    setState(() {
      songinfo = info.req.data.midurlinfo;
    });
    // print(songinfo.length);
    // print(widget.songList.length);
    // play(info.urlMid.data.midurlinfo[0].purl);
   

  }


  // post请求
  Future<Response> apiRequest(String url, Map jsonMap) async {
    // HttpClient httpClient = new HttpClient();
    // HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    // request.headers.set('content-type', 'application/json');
    // request.add(utf8.encode(json.encode(jsonMap)));
    // print(json.encode(jsonMap));
    // HttpClientResponse response = await request.close();
    // // todo - you should check the response.statusCode
    // String reply = await response.transform(utf8.decoder).join();
    // httpClient.close();
    
    response = await dio.post(url, data: json.encode(jsonMap));
    setState(() {
      // res = response.data.toString();
      res = response.toString();
    });
    // print(response.data.toString());
    // print(response.toString());
    return response;
  }

  Widget listViewDefault(List<SongInstance> list) {
    double width = MediaQuery.of(context).size.width;
    List<Widget> _list = new List();
    for (int i = 0; i < list.length; i++) {
      _list.add(
         new GestureDetector(
          //  onTap: () => print(songinfo[i].purl),
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context,) => new SongPage('https${songinfo[i].purl.substring(4,songinfo[i].purl.length)}', list[i].musicData.songname, list[i],widget.singername))),
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
                      list[i].musicData.songname, 
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )
                    ),
                    new Text(
                      widget.singername +'·' +list[i].musicData.albumname,
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