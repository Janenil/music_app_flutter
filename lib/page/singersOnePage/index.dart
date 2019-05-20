import 'package:flutter/material.dart';
// import '../../data/recommendList.dart';
// import 'package:music_app/util/httpController.dart';
// import '../../data/album.dart';
import '../../data/singerlist.dart';
import 'dart:convert';
import './list/list.dart';

import 'package:http/http.dart' as http;
import './data.dart';
class AlbumPage extends StatefulWidget {
  final SingerObj obj; 
  AlbumPage(this.obj);
  _AlbumPageState createState() => _AlbumPageState();
}


class _AlbumPageState extends State<AlbumPage>{
  
  SingerWrapper songlist;  
  void initState() {
    super.initState();
    _loadDataFromNetwork(widget.obj.fsingermid);
  }

  map(String id) {
    var map = <String, dynamic>{
      "g_tk": "1928093487",
      "inCharset": "utf-8",
      "outCharset": "utf-8",
      "notice": "0",
      "format": "jsonp",
      "singermid": id,
      "type": "1",
      "json": "1",
      "utf8": "1",
      "onlysong": "0",
      "platform": "yqq",
      "hostUin": "0",
      "needNewCode": "0",
      "order": "listen",
      "songstatus": 1,
      "jsonpCallback": "jp3"
    };
    return map;
  }
  _formatUrl(id) {
    return 'https://c.y.qq.com/v8/fcg-bin/fcg_v8_singer_track_cp.fcg?g_tk=1928093487&inCharset=utf-8&outCharset=utf-8&notice=0&format=jsonp&hostUin=0&needNewCode=0&platform=yqq&order=listen&begin=0&num=80&songstatus=1&singermid='+ id +'&jsonpCallback=jp2';
  }

  _loadDataFromNetwork(id) async{
    http.Response response = await http.get(_formatUrl(id));
    var _json = response.body;
      // print(item);
    var str = _json.substring(5, _json.length - 1);
    final jsonRes = json.decode(str);
    SingerWrapper songlists = new SingerWrapper.fromJson(jsonRes);
    setState(() {
      songlist = songlists;
    });
  }

  Widget childWidget() {
    Widget childwidget;
    if (songlist != null && songlist.data.list.length != 0) {
      childwidget =  new AlbumList(songlist.data.list, widget.obj.fsingername);
    } else {
      childwidget = new Center(child: new Text('loading'),);
    }
    return childwidget;
  }
  Widget build(BuildContext context) {
     return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.obj.fsingername,
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 16.0),
          ),
          backgroundColor: Colors.black,
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              height: 220.0,
              padding: const EdgeInsets.only(bottom: 10.0),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(
                    'https://y.gtimg.cn/music/photo_new/T001R300x300M000'+ widget.obj.fsingermid+'.jpg?max_age=2592000',
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // new Button(new Text('123'))
                    new OutlineButton(
                      borderSide:new BorderSide(color: Colors.yellow),
                      padding: const EdgeInsets.fromLTRB(30.0,0,30.0,0),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: new Row(
                        children: <Widget>[
                          new IconTheme(
                            data: new IconThemeData(color: Colors.yellow), // icon主题 
                            child: new Icon(Icons.music_note,),
                          ),
                          new Text('随机播放全部',style: new TextStyle(color:Colors.yellow))
                        ],
                      ),
                      onPressed: (){print('123');},
                    )
                ],
              ),
            ),
            childWidget()
            // new AlbumList(pros.cdList[0].songlist)
          ],
        )
      );
  }
}

