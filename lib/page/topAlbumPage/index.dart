import 'package:flutter/material.dart';
import '../../data/recommendList.dart';
import 'package:music_app/util/httpController.dart';
import '../../data/album.dart';
import 'dart:convert';
import './list/list.dart';
import './data.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/topList.dart';
class AlbumPage extends StatefulWidget {
  final ListObj obj; 
  AlbumPage(this.obj);
  _AlbumPageState createState() => _AlbumPageState();
}


class _AlbumPageState extends State<AlbumPage>{
  
  Top pros;  
  void initState() {
    super.initState();
    _loadDataFromNetwork(widget.obj.id);
  }

  map(int id) {
    var map = {
      "g_tk": "1928093487",
      "inCharset": "utf-8",
      "outCharset": "utf-8",
      "notice": "0",
      "format": "jsonp",
      "topid": id,
      "type": "top",
      "json": "1",
      "utf8": "1",
      "onlysong": "0",
      "platform": "yqq",
      "hostUin": "0",
      "needNewCode": "0"
    };
    return map;
  }
  formatUrl(dynamic id) {
    return 'https://c.y.qq.com/v8/fcg-bin/fcg_v8_toplist_cp.fcg?g_tk=1928093487&inCharset=utf-8&outCharset=utf-8&notice=0&format=jsonp&topid='+ id.toString()+'&needNewCode=1&uin=0&tpl=3&page=detail&type=top&platform=h5&jsonpCallback=jp1';

  }
  _loadDataFromNetwork(id) async{
    http.Response response = await http.get(formatUrl(id));
    
    var _json = response.body;
    // 截取
    var str = _json.substring(5, _json.length - 1);
    final jsonRes = json.decode(str);
    Top pro = new Top.fromJson(jsonRes);
    setState(() {
      pros = pro;
    });
  }

  Widget childWidget() {
    Widget childwidget;
    if (pros != null && pros.songlist.length != 0) {
      childwidget =  new AlbumList(pros.songlist);
    } else {
      childwidget = new Center(child: new Text('loading'),);
    }
    return childwidget;
  }
  Widget build(BuildContext context) {
     return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.obj.topTitle,
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
                    widget.obj.picUrl
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

